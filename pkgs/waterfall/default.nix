{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "waterfall-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/waterfall/Waterfall-Regular.ttf?raw=true";
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
