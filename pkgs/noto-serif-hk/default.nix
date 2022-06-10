{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-hk-${version}";
  version = "2022-06-08-123023";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/85bd399cae055c1b2f7201438d314f9a9784e8ea/ofl/notoserifhk/NotoSerifHK%5Bwght%5D.ttf?raw=true";
      name = "NotoSerifHK_wght_.ttf";
      sha256 = "707ee153cb6b84c10ae98da8e4d680892b604667ccebac3e933c26ed1400d71d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSerifHK_wght_.ttf $out/share/fonts/truetype/NotoSerifHK_wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Serif HK";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
