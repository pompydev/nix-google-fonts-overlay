#!/usr/bin/env bash

main() {
  clone_fonts &&
    install_nix_google_fonts_gen &&
    # update_overlay &&
    commit_changes
}

clone_fonts() {
  echo "Cloning https://github.com/google/fonts..."
  if [ ! -d ./fonts ]; then
    git clone https://github.com/google/fonts.git ./fonts --depth 1
  fi
}

install_nix_google_fonts_gen() {
  echo "Installing https://github.com/pompydev/nix-google-fonts-gen..."
  if [ ! -d ./nix-google-fonts-gen ]; then
    git clone https://github.com/pompydev/nix-google-fonts-gen.git ./nix-google-fonts-gen --depth 1
  fi

  pushd ./nix-google-fonts-gen &&
    pip install -r requirements.txt &&
    ./setup.py install &&
    popd
}

update_overlay() {
  echo "Updating overlay contents"

  if [ -d ./default.nix ]; then
    rm -rf default.nix
  fi

  if [ -d ./pkgs ]; then
    rm -rf pkgs
  fi

  nix-google-fonts-gen ./fonts .
  update_readme
}

update_readme() {
  local font_count
  echo "Updating README.md"
  font_count="$(ls pkgs | wc -l)"
  sed -E -i "s/\\*\\*[[:digit:]]+ high-quality fonts packaged for Nix\\*\\*/\\*\\*$font_count high-quality fonts packaged for Nix\\*\\*/" README.md
}

commit_changes() {
  local message
  git config --global user.email "41898282+github-actions[bot]@users.noreply.github.com"
  git config --global user.name "github-actions[bot]"

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

  message="Automatic update $(date "+%Y-%m-%d")"

  if ! git commit -m "$message"; then
    echo "Failed to commit"
    return 1
  fi

  echo "Done"
}

main
