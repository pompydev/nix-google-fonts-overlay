{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "yaldevi-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/5236812944acca710a7b6db2dbc583a02671ea2f/ofl/yaldevi/Yaldevi%5Bwght%5D.ttf?raw=true";
      name = "Yaldevi_wght_.ttf";
      sha256 = "21d5516cd9a8831964b57503f5b7a119aafa9603bdddd0183e91a0ac8c8dc2e4";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Yaldevi_wght_.ttf $out/share/fonts/truetype/Yaldevi_wght_.ttf
  '';

  meta = with lib; {
    description = "Yaldevi";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
