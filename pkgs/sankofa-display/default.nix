{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "sankofa-display-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/sankofadisplay/SankofaDisplay-Regular.ttf?raw=true";
      name = "SankofaDisplay-Regular.ttf";
      sha256 = "747b51b50660960d481505bf10354d68df79e6aea97fcac3faa8252dfb757429";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SankofaDisplay-Regular.ttf $out/share/fonts/truetype/SankofaDisplay-Regular.ttf
  '';

  meta = with lib; {
    description = "Sankofa Display";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
