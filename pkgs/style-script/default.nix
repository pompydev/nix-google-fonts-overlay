{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "style-script-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/stylescript/StyleScript-Regular.ttf?raw=true";
      name = "StyleScript-Regular.ttf";
      sha256 = "4f285aa7b2e87de9ea8fc3d3a571cc428257c42ac77b5f786d99d9949ac4ed9a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 StyleScript-Regular.ttf $out/share/fonts/truetype/StyleScript-Regular.ttf
  '';

  meta = with lib; {
    description = "Style Script";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
