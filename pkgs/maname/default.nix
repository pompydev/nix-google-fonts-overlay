{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "maname-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/maname/Maname-Regular.ttf?raw=true";
      name = "Maname-Regular.ttf";
      sha256 = "db07b4953f547081186104ab8e626bf405616b033598ee82eae90166e0c84e14";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Maname-Regular.ttf $out/share/fonts/truetype/Maname-Regular.ttf
  '';

  meta = with lib; {
    description = "Maname";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
