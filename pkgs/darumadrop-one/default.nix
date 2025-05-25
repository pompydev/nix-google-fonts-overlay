{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "darumadrop-one-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/darumadropone/DarumadropOne-Regular.ttf?raw=true";
      name = "DarumadropOne-Regular.ttf";
      sha256 = "beef6d9031918823176ea0f9f729cb811a5f250598d7c8c684b3dee333810689";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 DarumadropOne-Regular.ttf $out/share/fonts/truetype/DarumadropOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Darumadrop One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
