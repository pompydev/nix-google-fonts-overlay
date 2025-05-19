{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "rokkitt-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/rokkitt/Rokkitt%5Bwght%5D.ttf?raw=true";
      name = "Rokkitt_wght_.ttf";
      sha256 = "737b2881d2e98f85424b473ab049da3216289a1f84266becb972c87664de2b40";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/rokkitt/Rokkitt-Italic%5Bwght%5D.ttf?raw=true";
      name = "Rokkitt-Italic_wght_.ttf";
      sha256 = "acd236589a7fb42b60735c37a4d0d6dcd22bdad364e9503be428f5dd9e8615d5";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Rokkitt_wght_.ttf $out/share/fonts/truetype/Rokkitt_wght_.ttf
     install -Dm644 Rokkitt-Italic_wght_.ttf $out/share/fonts/truetype/Rokkitt-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Rokkitt";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
