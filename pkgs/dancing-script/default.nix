{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "dancing-script-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f8dc91f6f13564fd038c60c02e82f305be8c551d/ofl/dancingscript/DancingScript[wght].ttf?raw=true";
      name = "DancingScript[wght].ttf";
      sha256 = "21808625578fe8d8cd10cb684be546dca077b27cd03a53a2f1ec11dc743c924c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'DancingScript[wght].ttf' $out/share/fonts/truetype/'DancingScript[wght].ttf'
  '';

  meta = with lib; {
    description = "Dancing Script";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
