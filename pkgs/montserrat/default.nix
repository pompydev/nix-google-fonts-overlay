{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "montserrat-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/montserrat/Montserrat%5Bwght%5D.ttf?raw=true";
      name = "Montserrat_wght_.ttf";
      sha256 = "0f7b311b2f3279e4eef9b2f968bcdbab6e28f4daeb1f049f4f278a902bcd82f7";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/montserrat/Montserrat-Italic%5Bwght%5D.ttf?raw=true";
      name = "Montserrat-Italic_wght_.ttf";
      sha256 = "51607f316bc020e59f03cbf51543eecffbea501c0b31d73e5b82927c5cca442c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Montserrat_wght_.ttf $out/share/fonts/truetype/Montserrat_wght_.ttf
     install -Dm644 Montserrat-Italic_wght_.ttf $out/share/fonts/truetype/Montserrat-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Montserrat";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
