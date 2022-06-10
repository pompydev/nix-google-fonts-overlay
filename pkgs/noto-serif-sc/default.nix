{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-sc-${version}";
  version = "2022-06-08-123023";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8c90b452c80ba4d378bbb6da0f9ef63b910b0dde/ofl/notoserifsc/NotoSerifSC%5Bwght%5D.ttf?raw=true";
      name = "NotoSerifSC_wght_.ttf";
      sha256 = "03a7bc54364c5702e70e92b6877da74f4f0c5a22362910c66684bcc2dc03d3d1";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSerifSC_wght_.ttf $out/share/fonts/truetype/NotoSerifSC_wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Serif SC";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
