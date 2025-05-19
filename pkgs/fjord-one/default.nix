{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "fjord-one-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/fjordone/FjordOne-Regular.ttf?raw=true";
      name = "FjordOne-Regular.ttf";
      sha256 = "e589e22412b5382c1a4ec482af28c515d9c794ce8bde9a4c2db8ef2a6a063d86";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 FjordOne-Regular.ttf $out/share/fonts/truetype/FjordOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Fjord One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
