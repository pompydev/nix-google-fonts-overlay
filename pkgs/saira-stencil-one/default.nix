{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "saira-stencil-one-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/448d7b027e212084c735e516f32c4c22127c8704/ofl/sairastencilone/SairaStencilOne-Regular.ttf?raw=true";
      name = "SairaStencilOne-Regular.ttf";
      sha256 = "781496fdaf8e04cf6741b31025f6b4ba84f66021b097a8e0d85cbea2180cf223";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SairaStencilOne-Regular.ttf $out/share/fonts/truetype/SairaStencilOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Saira Stencil One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
