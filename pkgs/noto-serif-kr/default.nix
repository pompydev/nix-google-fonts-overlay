{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-kr-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notoserifkr/NotoSerifKR%5Bwght%5D.ttf?raw=true";
      name = "NotoSerifKR_wght_.ttf";
      sha256 = "11f8d5de6f1b79195efba3828aaa2ec95c1178f5ae976fb23c8d53250a9938f3";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSerifKR_wght_.ttf $out/share/fonts/truetype/NotoSerifKR_wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Serif KR";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
