{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "marcellus-sc-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/marcellussc/MarcellusSC-Regular.ttf?raw=true";
      name = "MarcellusSC-Regular.ttf";
      sha256 = "03044ab65228b0554c9a5c1e63df29d4e58a71857e212801aaf768dfd106bdf0";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 MarcellusSC-Regular.ttf $out/share/fonts/truetype/MarcellusSC-Regular.ttf
  '';

  meta = with lib; {
    description = "Marcellus SC";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
