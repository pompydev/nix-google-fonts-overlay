{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "moon-dance-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/moondance/MoonDance-Regular.ttf?raw=true";
      name = "MoonDance-Regular.ttf";
      sha256 = "f25e6830b0c1b95df85446fc064cc0bc8db1588600a260a441b03011189e8335";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 MoonDance-Regular.ttf $out/share/fonts/truetype/MoonDance-Regular.ttf
  '';

  meta = with lib; {
    description = "Moon Dance";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
