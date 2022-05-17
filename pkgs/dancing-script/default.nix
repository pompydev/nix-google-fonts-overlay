{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "dancing-script-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f8dc91f6f13564fd038c60c02e82f305be8c551d/ofl/dancingscript/DancingScript%5Bwght%5D.ttf?raw=true";
      name = "DancingScript_wght_.ttf";
      sha256 = "21808625578fe8d8cd10cb684be546dca077b27cd03a53a2f1ec11dc743c924c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 DancingScript_wght_.ttf $out/share/fonts/truetype/DancingScript_wght_.ttf
  '';

  meta = with lib; {
    description = "Dancing Script";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
