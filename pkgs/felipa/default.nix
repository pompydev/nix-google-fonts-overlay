{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "felipa-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/felipa/Felipa-Regular.ttf?raw=true";
      name = "Felipa-Regular.ttf";
      sha256 = "d3f07e2669e046acc1030139a4b08046d7eca87c0b477a8cc99ac1c46af84edc";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Felipa-Regular.ttf $out/share/fonts/truetype/Felipa-Regular.ttf
  '';

  meta = with lib; {
    description = "Felipa";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
