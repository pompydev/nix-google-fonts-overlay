{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "smooch-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/smooch/Smooch-Regular.ttf?raw=true";
      name = "Smooch-Regular.ttf";
      sha256 = "a6a90a4613d353228eb56a8b257879365f9282105989997f92b3930f2fc55d84";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Smooch-Regular.ttf $out/share/fonts/truetype/Smooch-Regular.ttf
  '';

  meta = with lib; {
    description = "Smooch";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
