{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ultra-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/apache/ultra/Ultra-Regular.ttf?raw=true";
      name = "Ultra-Regular.ttf";
      sha256 = "9ee63cffbc379e5d4eb5fed6a0b94b770da919497e5cba4a227a6393dae0939e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Ultra-Regular.ttf $out/share/fonts/truetype/Ultra-Regular.ttf
  '';

  meta = with lib; {
    description = "Ultra";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
