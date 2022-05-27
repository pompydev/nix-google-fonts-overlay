{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "calistoga-${version}";
  version = "2022-05-23-211740";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9e1fdc691d5820ecb79f76355a80a487ba78ad50/ofl/calistoga/Calistoga-Regular.ttf?raw=true";
      name = "Calistoga-Regular.ttf";
      sha256 = "90035db06f68599d725c3b9722a738940f7d76ed6236ed586c80c9c2993b3000";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Calistoga-Regular.ttf $out/share/fonts/truetype/Calistoga-Regular.ttf
  '';

  meta = with lib; {
    description = "Calistoga";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
