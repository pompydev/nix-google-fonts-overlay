{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-br-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/playwritebr/PlaywriteBR%5Bwght%5D.ttf?raw=true";
      name = "PlaywriteBR_wght_.ttf";
      sha256 = "31b8e64e49edef06243dfe4eb36210713a0555e043705c93f524bff93557a057";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteBR_wght_.ttf $out/share/fonts/truetype/PlaywriteBR_wght_.ttf
  '';

  meta = with lib; {
    description = "Playwrite BR";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
