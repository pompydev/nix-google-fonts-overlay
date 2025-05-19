{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "marko-one-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/markoone/MarkoOne-Regular.ttf?raw=true";
      name = "MarkoOne-Regular.ttf";
      sha256 = "6514019373dabdb5d91ab3d3d7e97d96a656738c634fbae047dbb8143815395d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 MarkoOne-Regular.ttf $out/share/fonts/truetype/MarkoOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Marko One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
