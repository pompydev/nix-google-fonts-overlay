{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "anton-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/anton/Anton-Regular.ttf?raw=true";
      name = "Anton-Regular.ttf";
      sha256 = "a4ba3a92350ebb031da0cb47630ac49eb265082ca1bc0450442f4a83ab947cab";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Anton-Regular.ttf $out/share/fonts/truetype/Anton-Regular.ttf
  '';

  meta = with lib; {
    description = "Anton";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
