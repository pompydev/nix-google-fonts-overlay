{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "podkova-${version}";
  version = "2022-05-23-231859";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/2d2737569a9626b680130747811148bee4acf8a5/ofl/podkova/Podkova%5Bwght%5D.ttf?raw=true";
      name = "Podkova_wght_.ttf";
      sha256 = "a7be6732a489b1c5c7c37a5c2e816fad901563ccd882e9bbc56d13eeebf4a4e7";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Podkova_wght_.ttf $out/share/fonts/truetype/Podkova_wght_.ttf
  '';

  meta = with lib; {
    description = "Podkova";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
