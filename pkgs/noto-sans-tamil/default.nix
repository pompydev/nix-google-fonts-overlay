{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-tamil-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosanstamil/NotoSansTamil%5Bwdth,wght%5D.ttf?raw=true";
      name = "NotoSansTamil_wdth,wght_.ttf";
      sha256 = "aa3a9b321f4b0bb2c40203ffbde9af89713227866e0e13f76e5b9eeea727cf88";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansTamil_wdth-wght_.ttf $out/share/fonts/truetype/NotoSansTamil_wdth-wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Tamil";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
