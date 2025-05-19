{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "braah-one-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/braahone/BraahOne-Regular.ttf?raw=true";
      name = "BraahOne-Regular.ttf";
      sha256 = "b571d948a89980dfed4e69170c852311989ce2807ec486572d6106049ffc9521";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BraahOne-Regular.ttf $out/share/fonts/truetype/BraahOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Braah One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
