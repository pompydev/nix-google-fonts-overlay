{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "anaheim-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/anaheim/Anaheim%5Bwght%5D.ttf?raw=true";
      name = "Anaheim_wght_.ttf";
      sha256 = "4dcf9445d6d6791377da5079771ef565abf19a1d93869d6a46dcd5341944a058";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Anaheim_wght_.ttf $out/share/fonts/truetype/Anaheim_wght_.ttf
  '';

  meta = with lib; {
    description = "Anaheim";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
