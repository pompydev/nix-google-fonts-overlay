{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bungee-spice-${version}";
  version = "2022-05-23-211740";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ddede62c24d12a0d978c1b837adbae0369dcfd91/ofl/bungeespice/BungeeSpice-Regular.ttf?raw=true";
      name = "BungeeSpice-Regular.ttf";
      sha256 = "acebe7b43a024b08cac59041313669921af7f5f6a3578769e88127e0c3becbda";
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
