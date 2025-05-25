{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bungee-shade-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/bungeeshade/BungeeShade-Regular.ttf?raw=true";
      name = "BungeeShade-Regular.ttf";
      sha256 = "665c626082682b462f4e696308eafa7071c114da8f8ff3fb73a289c7ff7df482";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BungeeShade-Regular.ttf $out/share/fonts/truetype/BungeeShade-Regular.ttf
  '';

  meta = with lib; {
    description = "Bungee Shade";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
