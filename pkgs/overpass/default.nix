{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "overpass-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d8f31106ea0af85ee2f3a3d38a2fe155de0d716c/ofl/overpass/Overpass[wght].ttf?raw=true";
      name = "Overpass[wght].ttf";
      sha256 = "970717df17a7f9911dee45f60695d05bfa9d745fa0a11fc5c348371fa21f0073";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d8f31106ea0af85ee2f3a3d38a2fe155de0d716c/ofl/overpass/Overpass-Italic[wght].ttf?raw=true";
      name = "Overpass-Italic[wght].ttf";
      sha256 = "3b45ac4193930bbeb491b5c76227afd5991607712f0d16d6bc5d74db6bbd8172";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'Overpass[wght].ttf' $out/share/fonts/truetype/'Overpass[wght].ttf'
     install -Dm644 'Overpass-Italic[wght].ttf' $out/share/fonts/truetype/'Overpass-Italic[wght].ttf'
  '';

  meta = with lib; {
    description = "Overpass";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
