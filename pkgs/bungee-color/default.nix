{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bungee-color-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9f92199e0e5e1b0495d1ffc560b4c8559799aa11/ofl/bungeecolor/BungeeColor-Regular.ttf?raw=true";
      name = "BungeeColor-Regular.ttf";
      sha256 = "17e6dc7624924c6a0de0ab5b587954168ce8f4676cf94df47b8696d396dd4fde";
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
