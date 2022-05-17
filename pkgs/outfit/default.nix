{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "outfit-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/29e94d990c84a54f83644e7c43f42dfc9e1a4ac7/ofl/outfit/Outfit%5Bwght%5D.ttf?raw=true";
      name = "Outfit_wght_.ttf";
      sha256 = "63bf759fb9d5f96edf6909adbfd3c8e6d44f7d1681064d6065dd2d1d258468e7";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Outfit_wght_.ttf $out/share/fonts/truetype/Outfit_wght_.ttf
  '';

  meta = with lib; {
    description = "Outfit";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
