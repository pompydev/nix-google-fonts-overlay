#!/usr/bin/env bash

main () {
  if [[ "$TRAVIS" != "true" ]]; then
    echo "This script is only meant to be used as a part of CI pipeline"
    return 1
  fi

  if [[ "$TRAVIS_PULL_REQUEST" != "false" ]]; then
    echo "Pull request, ignoring"
    return 0
  fi

  clone_fonts &&
  install_nix_google_fonts_gen &&
  update_overlay &&
  push_changes
}

clone_fonts () {
  echo "Cloning Google Fonts repository"
  git clone https://github.com/google/fonts.git ~/fonts >/dev/null 2>&1
}

install_nix_google_fonts_gen () {
  echo "Installing nix-google-fonts-gen"
  git clone https://github.com/dimitarnestorov/nix-google-fonts-gen.git ~/nix-google-fonts-gen >/dev/null 2>&1 &&
  pushd ~/nix-google-fonts-gen &&
  ./setup.py install &&
  popd
}

update_overlay () {
  echo "Updating overlay contents"
  rm -rf default.nix pkgs
  nix-google-fonts-gen ~/fonts .
  update_readme
}

update_readme () {
  local font_count
  echo "Updating README.md"
  font_count="$(ls pkgs | wc -l)"
  sed -E -i "s/\\*\\*[[:digit:]]+ high-quality fonts packaged for Nix\\*\\*/\\*\\*$font_count high-quality fonts packaged for Nix\\*\\*/" README.md
}

push_changes () {
  local message
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"

  if ! git add -A; then
    echo "Failed to add files"
    return 1
  fi

  if git diff-index --quiet HEAD; then
    echo "No changes since the last commit, exiting"
    return 0
  fi

  echo "Committing changes"

  git checkout master

  message="[skip ci] Automatic update $(date "+%Y-%m-%d") (Build $TRAVIS_BUILD_NUMBER)"

  if ! git commit -m "$message"; then
    echo "Failed to commit"
    return 1
  fi

  echo "Pushing"

  if ! git remote rm origin; then
    echo "Failed to remove origin"
    return 1
  fi

  if ! git remote add origin "git@github.com:dimitarnestorov/nix-google-fonts-overlay.git"; then
    echo "Failed to add origin";
  fi

  if ! git push origin master; then
    echo "Failed to push"
    return 1
  fi

  echo "Done"
}

main "$@"
