{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "nova-mono-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/novamono/NovaMono.ttf?raw=true";
      name = "NovaMono.ttf";
      sha256 = "648eadb6648c0801b186d3dcef60ee6aa84a791b1e09c726935c0712508b4807";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NovaMono.ttf $out/share/fonts/truetype/NovaMono.ttf
  '';

  meta = with lib; {
    description = "Nova Mono";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
