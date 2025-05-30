{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "rosarivo-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/rosarivo/Rosarivo-Regular.ttf?raw=true";
      name = "Rosarivo-Regular.ttf";
      sha256 = "8b6503b67c5c080bbef8cebc59f4665b7c6d45429c677ebffa0dbe797a4dc4d0";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/rosarivo/Rosarivo-Italic.ttf?raw=true";
      name = "Rosarivo-Italic.ttf";
      sha256 = "a9865d8ed5f7984c6994b8630a6ee9fa29395a13a72b5e257b3461139e305b47";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Rosarivo-Regular.ttf $out/share/fonts/truetype/Rosarivo-Regular.ttf
     install -Dm644 Rosarivo-Italic.ttf $out/share/fonts/truetype/Rosarivo-Italic.ttf
  '';

  meta = with lib; {
    description = "Rosarivo";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
