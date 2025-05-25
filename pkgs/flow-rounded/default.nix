{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "flow-rounded-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/flowrounded/FlowRounded-Regular.ttf?raw=true";
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
