{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "nixie-one-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/nixieone/NixieOne-Regular.ttf?raw=true";
      name = "NixieOne-Regular.ttf";
      sha256 = "69030eb096d2590d00f4ac79fefa1e6e9c12f2d396a37527a1f7d6c047cd0f5d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NixieOne-Regular.ttf $out/share/fonts/truetype/NixieOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Nixie One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
