{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "flow-circular-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/flowcircular/FlowCircular-Regular.ttf?raw=true";
      name = "FlowCircular-Regular.ttf";
      sha256 = "ea87d5b1d0be7c5a3cf63054ad3e1d5ed54cca7491f9237a1226cb72f6340e78";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 FlowCircular-Regular.ttf $out/share/fonts/truetype/FlowCircular-Regular.ttf
  '';

  meta = with lib; {
    description = "Flow Circular";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
