{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "smooch-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/smooch/Smooch-Regular.ttf?raw=true";
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
