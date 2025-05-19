{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "gotu-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/gotu/Gotu-Regular.ttf?raw=true";
      name = "Gotu-Regular.ttf";
      sha256 = "766fbfb19d8a0c38814b23c42515ed9dea538fce18d741221eca321d0604a3f5";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Gotu-Regular.ttf $out/share/fonts/truetype/Gotu-Regular.ttf
  '';

  meta = with lib; {
    description = "Gotu";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
