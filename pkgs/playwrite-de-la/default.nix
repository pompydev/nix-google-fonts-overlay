{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-de-la-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/playwritedela/PlaywriteDELA%5Bwght%5D.ttf?raw=true";
      name = "PlaywriteDELA_wght_.ttf";
      sha256 = "c45f43a5f51f385bf0a32e27a4b8e0397757893e5d41121ce962a70e6bd1b691";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteDELA_wght_.ttf $out/share/fonts/truetype/PlaywriteDELA_wght_.ttf
  '';

  meta = with lib; {
    description = "Playwrite DE LA";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
