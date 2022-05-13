{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "kolker-brush-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a6cae74f6cde0de6082e774065f5c0ef323310cf/ofl/kolkerbrush/KolkerBrush-Regular.ttf?raw=true";
      name = "KolkerBrush-Regular.ttf";
      sha256 = "c0914812bc5b224cc0e8321de70021a33a1a766b9efaf525f7463200f82300f4";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 KolkerBrush-Regular.ttf $out/share/fonts/truetype/KolkerBrush-Regular.ttf
  '';

  meta = with lib; {
    description = "Kolker Brush";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
