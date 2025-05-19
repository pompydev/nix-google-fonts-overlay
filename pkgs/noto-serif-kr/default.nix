{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-kr-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notoserifkr/NotoSerifKR%5Bwght%5D.ttf?raw=true";
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
