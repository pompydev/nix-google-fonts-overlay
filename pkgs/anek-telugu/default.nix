{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "anek-telugu-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/2d216f8bd5906809f23313a9fe05480000669367/ofl/anektelugu/AnekTelugu[wdth,wght].ttf?raw=true";
      name = "AnekTelugu[wdth,wght].ttf";
      sha256 = "25981968a8a3faab975993a54eec455829214390821037fb3a4d6c447d2e1179";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'AnekTelugu[wdth,wght].ttf' $out/share/fonts/truetype/'AnekTelugu[wdth,wght].ttf'
  '';

  meta = with lib; {
    description = "Anek Telugu";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
