{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "gluten-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/846eb7f39ee398e771a2807cc94ab7fd86bb8565/ofl/gluten/Gluten[wght].ttf?raw=true";
      name = "Gluten[wght].ttf";
      sha256 = "a0b1811546f40f04ab2e4eb057dd1614ec7878880d9f43748257b12d36134b64";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'Gluten[wght].ttf' $out/share/fonts/truetype/'Gluten[wght].ttf'
  '';

  meta = with lib; {
    description = "Gluten";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
