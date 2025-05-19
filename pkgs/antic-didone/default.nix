{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "antic-didone-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/anticdidone/AnticDidone-Regular.ttf?raw=true";
      name = "AnticDidone-Regular.ttf";
      sha256 = "63a560792f0cb5342c0da7759c9df2e1ce0324a8af46ae976d9458fbcccbb440";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AnticDidone-Regular.ttf $out/share/fonts/truetype/AnticDidone-Regular.ttf
  '';

  meta = with lib; {
    description = "Antic Didone";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
