{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-imperial-aramaic-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosansimperialaramaic/NotoSansImperialAramaic-Regular.ttf?raw=true";
      name = "NotoSansImperialAramaic-Regular.ttf";
      sha256 = "51433e25557eac79df4e447e0b6be4a23bcf3680a60432ebb388a13ea82d227d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansImperialAramaic-Regular.ttf $out/share/fonts/truetype/NotoSansImperialAramaic-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Imperial Aramaic";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
