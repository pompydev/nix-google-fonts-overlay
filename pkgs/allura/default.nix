{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "allura-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/allura/Allura-Regular.ttf?raw=true";
      name = "Allura-Regular.ttf";
      sha256 = "9c142b2e515832c0dfc4ff8b8ea18f40314943bf937b72e2b23c4661bac14cc6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Allura-Regular.ttf $out/share/fonts/truetype/Allura-Regular.ttf
  '';

  meta = with lib; {
    description = "Allura";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
