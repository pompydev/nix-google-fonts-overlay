{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-kr-${version}";
  version = "2022-06-08-123023";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/bfee88347c2ec7477c6be7db725098a5c3425e6b/ofl/notoserifkr/NotoSerifKR%5Bwght%5D.ttf?raw=true";
      name = "NotoSerifKR_wght_.ttf";
      sha256 = "d4775924c16ce8ecc563cbc1a9e3794fd21df85edae2fbd18497b7bd679b54dd";
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
