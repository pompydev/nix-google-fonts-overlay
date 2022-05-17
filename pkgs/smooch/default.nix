{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "smooch-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/5eaf6b5b3f3488b68189ddd5e2277026744461bb/ofl/smooch/Smooch-Regular.ttf?raw=true";
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
