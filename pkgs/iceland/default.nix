{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "iceland-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/iceland/Iceland-Regular.ttf?raw=true";
      name = "Iceland-Regular.ttf";
      sha256 = "5b5919189e5d01a6fac79251aaf9fa9565a738c39974cbe13de98ac02ec7fff5";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Iceland-Regular.ttf $out/share/fonts/truetype/Iceland-Regular.ttf
  '';

  meta = with lib; {
    description = "Iceland";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
