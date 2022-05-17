{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "flow-rounded-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4eafa089518e614a30fa2e783879f45cec0da803/ofl/flowrounded/FlowRounded-Regular.ttf?raw=true";
      name = "FlowRounded-Regular.ttf";
      sha256 = "dd3319188800beba4f303532f254880f77c513dfb8ee54e44cd7fa2fdeb25123";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 FlowRounded-Regular.ttf $out/share/fonts/truetype/FlowRounded-Regular.ttf
  '';

  meta = with lib; {
    description = "Flow Rounded";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
