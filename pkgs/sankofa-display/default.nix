{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "sankofa-display-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/sankofadisplay/SankofaDisplay-Regular.ttf?raw=true";
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
