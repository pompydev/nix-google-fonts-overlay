{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "amarante-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/amarante/Amarante-Regular.ttf?raw=true";
      name = "Amarante-Regular.ttf";
      sha256 = "de5eb7cc2b13632fe3f9fedbe4dc34571a76758cfb52b71fdace8fc4a7638a2f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Amarante-Regular.ttf $out/share/fonts/truetype/Amarante-Regular.ttf
  '';

  meta = with lib; {
    description = "Amarante";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
