{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "gayathri-${version}";
  version = "2022-05-23-214203";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9c887c8b29eb58b39e23e21b8b9c5df25eed9c25/ofl/gayathri/Gayathri-Thin.ttf?raw=true";
      name = "Gayathri-Thin.ttf";
      sha256 = "5c60a888ea5c0d1d259a1803fdbe9d7fa5c8ef9edce952482efa9f59dde4519d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9c887c8b29eb58b39e23e21b8b9c5df25eed9c25/ofl/gayathri/Gayathri-Regular.ttf?raw=true";
      name = "Gayathri-Regular.ttf";
      sha256 = "c4fab5d994518247f78d96bf212a7d5b36563b60663136765fbaebd33a74d4f9";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9c887c8b29eb58b39e23e21b8b9c5df25eed9c25/ofl/gayathri/Gayathri-Bold.ttf?raw=true";
      name = "Gayathri-Bold.ttf";
      sha256 = "ad62d4ab2990d5bba9203c205513a8e162a44a03c58269f9a8b138cad9c0d5e3";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Gayathri-Thin.ttf $out/share/fonts/truetype/Gayathri-Thin.ttf
     install -Dm644 Gayathri-Regular.ttf $out/share/fonts/truetype/Gayathri-Regular.ttf
     install -Dm644 Gayathri-Bold.ttf $out/share/fonts/truetype/Gayathri-Bold.ttf
  '';

  meta = with lib; {
    description = "Gayathri";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
