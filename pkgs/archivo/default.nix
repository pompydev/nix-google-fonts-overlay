{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "archivo-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/6c70c829f09ea345d3590406693220ea35c6553f/ofl/archivo/Archivo%5Bwdth,wght%5D.ttf?raw=true";
      name = "Archivo_wdth,wght_.ttf";
      sha256 = "0e094a7d3c7c4c25cf1310c4b30014f1dae9332220b1c2c88f4fa996f0b05053";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/6c70c829f09ea345d3590406693220ea35c6553f/ofl/archivo/Archivo-Italic%5Bwdth,wght%5D.ttf?raw=true";
      name = "Archivo-Italic_wdth,wght_.ttf";
      sha256 = "305d13b4eb80e62f7d517f78d7c045250d977552a420f2dbed906f314e761305";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Archivo_wdth,wght_.ttf $out/share/fonts/truetype/Archivo_wdth,wght_.ttf
     install -Dm644 Archivo-Italic_wdth,wght_.ttf $out/share/fonts/truetype/Archivo-Italic_wdth,wght_.ttf
  '';

  meta = with lib; {
    description = "Archivo";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
