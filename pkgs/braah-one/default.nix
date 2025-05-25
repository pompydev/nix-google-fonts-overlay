{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "braah-one-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/braahone/BraahOne-Regular.ttf?raw=true";
      name = "BraahOne-Regular.ttf";
      sha256 = "b571d948a89980dfed4e69170c852311989ce2807ec486572d6106049ffc9521";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BraahOne-Regular.ttf $out/share/fonts/truetype/BraahOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Braah One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
