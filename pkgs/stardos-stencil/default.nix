{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "stardos-stencil-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/stardosstencil/StardosStencil-Regular.ttf?raw=true";
      name = "StardosStencil-Regular.ttf";
      sha256 = "208b13d15387c282a1c0c439a8e4c38809243d15c361b31da440b25a7e4f39ae";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/stardosstencil/StardosStencil-Bold.ttf?raw=true";
      name = "StardosStencil-Bold.ttf";
      sha256 = "6b15f50b1b358512d922b5f11937af17e90704587e1d7fb009f1715d2d5dfa74";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 StardosStencil-Regular.ttf $out/share/fonts/truetype/StardosStencil-Regular.ttf
     install -Dm644 StardosStencil-Bold.ttf $out/share/fonts/truetype/StardosStencil-Bold.ttf
  '';

  meta = with lib; {
    description = "Stardos Stencil";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
