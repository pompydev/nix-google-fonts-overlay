{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "saira-stencil-one-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/sairastencilone/SairaStencilOne-Regular.ttf?raw=true";
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
