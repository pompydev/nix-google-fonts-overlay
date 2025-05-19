{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "condiment-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/condiment/Condiment-Regular.ttf?raw=true";
      name = "Condiment-Regular.ttf";
      sha256 = "fb12978739fe3824e95b3e5f739ae623f888f715fe44481117fb3436be9a4b5d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Condiment-Regular.ttf $out/share/fonts/truetype/Condiment-Regular.ttf
  '';

  meta = with lib; {
    description = "Condiment";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
