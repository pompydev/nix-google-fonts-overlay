{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "gruppo-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/gruppo/Gruppo-Regular.ttf?raw=true";
      name = "Gruppo-Regular.ttf";
      sha256 = "b14da5eb049a6dd097c79b0a7d55450542ad0ff213cdfea492815a79c58244a7";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Gruppo-Regular.ttf $out/share/fonts/truetype/Gruppo-Regular.ttf
  '';

  meta = with lib; {
    description = "Gruppo";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
