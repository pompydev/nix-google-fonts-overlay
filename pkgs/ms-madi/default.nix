{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ms-madi-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/msmadi/MsMadi-Regular.ttf?raw=true";
      name = "MsMadi-Regular.ttf";
      sha256 = "08dfe959077490d11a4dd0d3097b48daafdecef821e290c973cd1893595cc208";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 MsMadi-Regular.ttf $out/share/fonts/truetype/MsMadi-Regular.ttf
  '';

  meta = with lib; {
    description = "Ms Madi";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
