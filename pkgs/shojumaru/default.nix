{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "shojumaru-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/shojumaru/Shojumaru-Regular.ttf?raw=true";
      name = "Shojumaru-Regular.ttf";
      sha256 = "8607110ef45da664861c72d95fb804c3609169ebfd2a380cb47b353a7b241c75";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Shojumaru-Regular.ttf $out/share/fonts/truetype/Shojumaru-Regular.ttf
  '';

  meta = with lib; {
    description = "Shojumaru";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
