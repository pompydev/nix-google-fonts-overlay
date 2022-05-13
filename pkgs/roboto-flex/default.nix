{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "roboto-flex-${version}";
  version = "2022-04-27-155816";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/dce3aa6dca876ac74f787ae655373af010160e7b/ofl/robotoflex/RobotoFlex[GRAD,XOPQ,XTRA,YOPQ,YTAS,YTDE,YTFI,YTLC,YTUC,opsz,slnt,wdth,wght].ttf?raw=true";
      name = "RobotoFlex[GRAD,XOPQ,XTRA,YOPQ,YTAS,YTDE,YTFI,YTLC,YTUC,opsz,slnt,wdth,wght].ttf";
      sha256 = "a8663ec429d36a7f243314289665da11ba5b6a7c8b032b02be85366451d88142";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'RobotoFlex[GRAD,XOPQ,XTRA,YOPQ,YTAS,YTDE,YTFI,YTLC,YTUC,opsz,slnt,wdth,wght].ttf' $out/share/fonts/truetype/'RobotoFlex[GRAD,XOPQ,XTRA,YOPQ,YTAS,YTDE,YTFI,YTLC,YTUC,opsz,slnt,wdth,wght].ttf'
  '';

  meta = with lib; {
    description = "Roboto Flex";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
