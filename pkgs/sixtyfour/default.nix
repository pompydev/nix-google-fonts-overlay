{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "sixtyfour-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/sixtyfour/Sixtyfour%5BBLED,SCAN%5D.ttf?raw=true";
      name = "Sixtyfour_BLED,SCAN_.ttf";
      sha256 = "3d5a3bb3257a491124347bac83ca7f0c8c77a9961270f353b498f3153e751c68";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Sixtyfour_BLED,SCAN_.ttf $out/share/fonts/truetype/Sixtyfour_BLED,SCAN_.ttf
  '';

  meta = with lib; {
    description = "Sixtyfour";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
