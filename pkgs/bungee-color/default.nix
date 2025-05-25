{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bungee-color-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/bungeecolor/BungeeColor-Regular.ttf?raw=true";
      name = "BungeeColor-Regular.ttf";
      sha256 = "cf21a786e54f43694f4edbb51a38f81331a4c3414217c524c8cb2d091aa7fd63";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BungeeColor-Regular.ttf $out/share/fonts/truetype/BungeeColor-Regular.ttf
  '';

  meta = with lib; {
    description = "Bungee Color";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
