{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "flow-circular-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4eafa089518e614a30fa2e783879f45cec0da803/ofl/flowcircular/FlowCircular-Regular.ttf?raw=true";
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
