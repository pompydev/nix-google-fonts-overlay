{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bungee-shade-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/bungeeshade/BungeeShade-Regular.ttf?raw=true";
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
