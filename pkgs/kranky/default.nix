{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "kranky-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/apache/kranky/Kranky-Regular.ttf?raw=true";
      name = "Kranky-Regular.ttf";
      sha256 = "2b40548b2a84e3daa922f770657aefc86d4ce13d155b96912bea2d50bcb09cc4";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Kranky-Regular.ttf $out/share/fonts/truetype/Kranky-Regular.ttf
  '';

  meta = with lib; {
    description = "Kranky";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
