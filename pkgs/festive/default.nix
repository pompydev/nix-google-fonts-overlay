{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "festive-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7d43ecce95de59077ba3031103badf5c76a8cf34/ofl/festive/Festive-Regular.ttf?raw=true";
      name = "Festive-Regular.ttf";
      sha256 = "34940d4e68ffdbaee80e25d9ac8ef956eb0f4965c804d067041373ddca6a9ec8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Festive-Regular.ttf $out/share/fonts/truetype/Festive-Regular.ttf
  '';

  meta = with lib; {
    description = "Festive";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
