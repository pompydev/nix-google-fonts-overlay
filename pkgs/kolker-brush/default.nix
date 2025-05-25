{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "kolker-brush-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/kolkerbrush/KolkerBrush-Regular.ttf?raw=true";
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
