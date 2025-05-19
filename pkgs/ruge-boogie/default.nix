{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ruge-boogie-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/rugeboogie/RugeBoogie-Regular.ttf?raw=true";
      name = "RugeBoogie-Regular.ttf";
      sha256 = "affe25b2431ecd42cb8c6eeb2de56bb264d666e6a4b2b27b6ac3e2257436eed0";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 RugeBoogie-Regular.ttf $out/share/fonts/truetype/RugeBoogie-Regular.ttf
  '';

  meta = with lib; {
    description = "Ruge Boogie";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
