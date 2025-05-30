{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "shojumaru-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/shojumaru/Shojumaru-Regular.ttf?raw=true";
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
