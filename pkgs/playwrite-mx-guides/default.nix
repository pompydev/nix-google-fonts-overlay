{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-mx-guides-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/playwritemxguides/PlaywriteMXGuides-Regular.ttf?raw=true";
      name = "PlaywriteMXGuides-Regular.ttf";
      sha256 = "073508607580ec4fd01e65dfcdb98379316cbf47d361ac946234fbee870cd16a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteMXGuides-Regular.ttf $out/share/fonts/truetype/PlaywriteMXGuides-Regular.ttf
  '';

  meta = with lib; {
    description = "Playwrite MX Guides";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
