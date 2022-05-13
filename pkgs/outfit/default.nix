{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "outfit-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/29e94d990c84a54f83644e7c43f42dfc9e1a4ac7/ofl/outfit/Outfit[wght].ttf?raw=true";
      name = "Outfit[wght].ttf";
      sha256 = "63bf759fb9d5f96edf6909adbfd3c8e6d44f7d1681064d6065dd2d1d258468e7";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'Outfit[wght].ttf' $out/share/fonts/truetype/'Outfit[wght].ttf'
  '';

  meta = with lib; {
    description = "Outfit";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
