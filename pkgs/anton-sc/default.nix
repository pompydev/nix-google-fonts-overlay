{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "anton-sc-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/antonsc/AntonSC-Regular.ttf?raw=true";
      name = "AntonSC-Regular.ttf";
      sha256 = "a38d04953f7a3878d947381081b2b80c673dec58404878702788a9c81a944bea";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AntonSC-Regular.ttf $out/share/fonts/truetype/AntonSC-Regular.ttf
  '';

  meta = with lib; {
    description = "Anton SC";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
