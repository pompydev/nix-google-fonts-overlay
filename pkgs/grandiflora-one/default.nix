{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "grandiflora-one-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/grandifloraone/GrandifloraOne-Regular.ttf?raw=true";
      name = "GrandifloraOne-Regular.ttf";
      sha256 = "592da2454a6626ee68558e220df28808b95f7dd140cd1ceb8a0d72b777f157ad";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 GrandifloraOne-Regular.ttf $out/share/fonts/truetype/GrandifloraOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Grandiflora One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
