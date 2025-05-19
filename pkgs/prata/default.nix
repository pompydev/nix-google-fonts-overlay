{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "prata-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/prata/Prata-Regular.ttf?raw=true";
      name = "Prata-Regular.ttf";
      sha256 = "3b2b880737be3bda5f03554297b758516876157c88f9e3b3bae8fa1fc96a2c2c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Prata-Regular.ttf $out/share/fonts/truetype/Prata-Regular.ttf
  '';

  meta = with lib; {
    description = "Prata";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
