{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "amiri-quran-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/amiriquran/AmiriQuran-Regular.ttf?raw=true";
      name = "AmiriQuran-Regular.ttf";
      sha256 = "3eb64ce8c981993c6c561ceb74e4a11589595627a4038c1f17be94057cf95c0a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AmiriQuran-Regular.ttf $out/share/fonts/truetype/AmiriQuran-Regular.ttf
  '';

  meta = with lib; {
    description = "Amiri Quran";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
