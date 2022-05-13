{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "anek-devanagari-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ac1371ad5eccb06352daf399448b673a79c98024/ofl/anekdevanagari/AnekDevanagari[wdth,wght].ttf?raw=true";
      name = "AnekDevanagari[wdth,wght].ttf";
      sha256 = "b88cf0ff5705599b2f16fce4ba9ce2029f76106dd24f0419976c417d89f20888";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'AnekDevanagari[wdth,wght].ttf' $out/share/fonts/truetype/'AnekDevanagari[wdth,wght].ttf'
  '';

  meta = with lib; {
    description = "Anek Devanagari";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
