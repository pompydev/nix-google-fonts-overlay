{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bungee-outline-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/bungeeoutline/BungeeOutline-Regular.ttf?raw=true";
      name = "BungeeOutline-Regular.ttf";
      sha256 = "9232000ff85fdbb68987007305f2de877486d63d31450f81b403461bbe721f1f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BungeeOutline-Regular.ttf $out/share/fonts/truetype/BungeeOutline-Regular.ttf
  '';

  meta = with lib; {
    description = "Bungee Outline";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
