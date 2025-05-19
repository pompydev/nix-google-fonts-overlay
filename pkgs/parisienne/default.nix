{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "parisienne-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/parisienne/Parisienne-Regular.ttf?raw=true";
      name = "Parisienne-Regular.ttf";
      sha256 = "bc9ee17f022e20bc700797e5f557d14bfa43af0c98d9e6c9c5c1ca4ec7aacd57";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Parisienne-Regular.ttf $out/share/fonts/truetype/Parisienne-Regular.ttf
  '';

  meta = with lib; {
    description = "Parisienne";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
