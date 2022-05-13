{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ruthie-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/6d91f3c06971d51f10e4327e3a7a5ba51d5dd318/ofl/ruthie/Ruthie-Regular.ttf?raw=true";
      name = "Ruthie-Regular.ttf";
      sha256 = "f97e99910e79a6caebcc18dcca305969a0ab42595fce6767139f260c193da302";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Ruthie-Regular.ttf $out/share/fonts/truetype/Ruthie-Regular.ttf
  '';

  meta = with lib; {
    description = "Ruthie";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
