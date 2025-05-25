{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "dotum-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/dotum/Dotum-Regular.ttf?raw=true";
      name = "Dotum-Regular.ttf";
      sha256 = "12f749ac462e547e3f4073227bb3b2b4c116062fc7546fbdadaa04e5e9f88b12";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Dotum-Regular.ttf $out/share/fonts/truetype/Dotum-Regular.ttf
  '';

  meta = with lib; {
    description = "Dotum";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
