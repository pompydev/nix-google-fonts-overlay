{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-be-vlg-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/playwritebevlg/PlaywriteBEVLG%5Bwght%5D.ttf?raw=true";
      name = "PlaywriteBEVLG_wght_.ttf";
      sha256 = "f98fd3cb89c1a04521586cbc16fd1b5d9913b3ad83a9f6202a5bb0ddc92d0067";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteBEVLG_wght_.ttf $out/share/fonts/truetype/PlaywriteBEVLG_wght_.ttf
  '';

  meta = with lib; {
    description = "Playwrite BE VLG";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
