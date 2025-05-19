{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-hk-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notoserifhk/NotoSerifHK%5Bwght%5D.ttf?raw=true";
      name = "NotoSerifHK_wght_.ttf";
      sha256 = "66108860e321aa413e7cb346448b4a418b779d94ae392accb32d163c024ae661";
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
