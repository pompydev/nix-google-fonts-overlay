{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "gungsuhche-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/gungsuhche/GungsuhChe-Regular.ttf?raw=true";
      name = "GungsuhChe-Regular.ttf";
      sha256 = "ad7744ead7cb467fa12ffc565d1ba864a1a2f972c1bea1e3208062c369982c64";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 GungsuhChe-Regular.ttf $out/share/fonts/truetype/GungsuhChe-Regular.ttf
  '';

  meta = with lib; {
    description = "GungsuhChe";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
