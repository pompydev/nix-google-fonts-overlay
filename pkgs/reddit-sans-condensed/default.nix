{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "reddit-sans-condensed-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/redditsanscondensed/RedditSansCondensed%5Bwght%5D.ttf?raw=true";
      name = "RedditSansCondensed_wght_.ttf";
      sha256 = "465d997d243d4dd5e08ab7285b03cfbe0ea8598066f8565924d7bd6fc83428e8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 RedditSansCondensed_wght_.ttf $out/share/fonts/truetype/RedditSansCondensed_wght_.ttf
  '';

  meta = with lib; {
    description = "Reddit Sans Condensed";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
