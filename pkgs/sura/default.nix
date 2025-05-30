{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "sura-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/sura/Sura-Regular.ttf?raw=true";
      name = "Sura-Regular.ttf";
      sha256 = "df35bdf883ef6cda173f3e75e88970a257ae69eaa94b93655451f33b9f960234";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/sura/Sura-Bold.ttf?raw=true";
      name = "Sura-Bold.ttf";
      sha256 = "3f05a9ce75f1d8eaf8f2dc57684fc8aa84a81fa72a437583849eeb84f57089eb";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Sura-Regular.ttf $out/share/fonts/truetype/Sura-Regular.ttf
     install -Dm644 Sura-Bold.ttf $out/share/fonts/truetype/Sura-Bold.ttf
  '';

  meta = with lib; {
    description = "Sura";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
