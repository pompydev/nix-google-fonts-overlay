{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "major-mono-display-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/majormonodisplay/MajorMonoDisplay-Regular.ttf?raw=true";
      name = "MajorMonoDisplay-Regular.ttf";
      sha256 = "3f2ee71c2b8464f065bf960a148be81d68fcc13385df87737928f948208dffc6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 MajorMonoDisplay-Regular.ttf $out/share/fonts/truetype/MajorMonoDisplay-Regular.ttf
  '';

  meta = with lib; {
    description = "Major Mono Display";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
