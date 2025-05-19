{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "micro-5-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/micro5/Micro5-Regular.ttf?raw=true";
      name = "Micro5-Regular.ttf";
      sha256 = "08a08c0d10129d2ecd869ff2f8914fcbf32487d3cbee3568b2a2957866dfdac8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Micro5-Regular.ttf $out/share/fonts/truetype/Micro5-Regular.ttf
  '';

  meta = with lib; {
    description = "Micro 5";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
