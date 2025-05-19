{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "gilda-display-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/gildadisplay/GildaDisplay-Regular.ttf?raw=true";
      name = "GildaDisplay-Regular.ttf";
      sha256 = "8ca5475692552cd4f149bcd00099c098453c39b8541f4abe2192f84ad17a7aa0";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 GildaDisplay-Regular.ttf $out/share/fonts/truetype/GildaDisplay-Regular.ttf
  '';

  meta = with lib; {
    description = "Gilda Display";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
