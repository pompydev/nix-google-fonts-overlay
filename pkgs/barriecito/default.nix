{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "barriecito-${version}";
  version = "2022-05-23-211740";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/fd24cf6d5c70e889039d3f42b226b52a65830cae/ofl/barriecito/Barriecito-Regular.ttf?raw=true";
      name = "Barriecito-Regular.ttf";
      sha256 = "ff32a099b68e0eb5e236adcb9a58141d00fbdf196586e421d1c6a0d1859f75b8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Barriecito-Regular.ttf $out/share/fonts/truetype/Barriecito-Regular.ttf
  '';

  meta = with lib; {
    description = "Barriecito";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
