{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bungee-spice-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/bungeespice/BungeeSpice-Regular.ttf?raw=true";
      name = "BungeeSpice-Regular.ttf";
      sha256 = "ccf8e3f7eb1ac87ed217097332856f9007484362a00ae3b42a03c6ef851158d0";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BungeeSpice-Regular.ttf $out/share/fonts/truetype/BungeeSpice-Regular.ttf
  '';

  meta = with lib; {
    description = "Bungee Spice";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
