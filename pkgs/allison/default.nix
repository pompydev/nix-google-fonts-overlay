{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "allison-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/allison/Allison-Regular.ttf?raw=true";
      name = "Allison-Regular.ttf";
      sha256 = "990750bc970472808cef2fceaed3424c922e781aee99e57907a68a9932d3a066";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Allison-Regular.ttf $out/share/fonts/truetype/Allison-Regular.ttf
  '';

  meta = with lib; {
    description = "Allison";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
