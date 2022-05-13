{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "reem-kufi-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e3db99000da5a629aa53c1913abd7040fa200cad/ofl/reemkufi/ReemKufi[wght].ttf?raw=true";
      name = "ReemKufi[wght].ttf";
      sha256 = "1b009a8bf9eeeaddc6f4b87e43e9b44b32133c88346888aae1bfbcd6dcccee6a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'ReemKufi[wght].ttf' $out/share/fonts/truetype/'ReemKufi[wght].ttf'
  '';

  meta = with lib; {
    description = "Reem Kufi";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
