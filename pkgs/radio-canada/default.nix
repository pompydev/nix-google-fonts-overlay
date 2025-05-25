{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "radio-canada-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/radiocanada/RadioCanada%5Bwdth,wght%5D.ttf?raw=true";
      name = "RadioCanada_wdth,wght_.ttf";
      sha256 = "54918d2c5fadb4436e8fd304f97fa0c7bc7a5d504e9a37773fb4df0f33d42056";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/radiocanada/RadioCanada-Italic%5Bwdth,wght%5D.ttf?raw=true";
      name = "RadioCanada-Italic_wdth,wght_.ttf";
      sha256 = "473fa77b1d9b106828de36fd6371670829c8b5770f83d6b905ec3c052478a1a3";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 RadioCanada_wdth-wght_.ttf $out/share/fonts/truetype/RadioCanada_wdth-wght_.ttf
     install -Dm644 RadioCanada-Italic_wdth-wght_.ttf $out/share/fonts/truetype/RadioCanada-Italic_wdth-wght_.ttf
  '';

  meta = with lib; {
    description = "Radio Canada";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
