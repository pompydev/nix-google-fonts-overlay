{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "waterfall-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/2e225dc5ed9a1ccbf4965ab12dfd141cc2e56b96/ofl/waterfall/Waterfall-Regular.ttf?raw=true";
      name = "Waterfall-Regular.ttf";
      sha256 = "83dd964cccae10084e3f3b3168247d47a06375f9efe893cee0b5488cba83eff3";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Waterfall-Regular.ttf $out/share/fonts/truetype/Waterfall-Regular.ttf
  '';

  meta = with lib; {
    description = "Waterfall";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
