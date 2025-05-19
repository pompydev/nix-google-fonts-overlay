{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "sonsie-one-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/sonsieone/SonsieOne-Regular.ttf?raw=true";
      name = "SonsieOne-Regular.ttf";
      sha256 = "af927e627f54066390d6433631106defec38541255083ea36e4c4da27dad7525";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SonsieOne-Regular.ttf $out/share/fonts/truetype/SonsieOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Sonsie One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
