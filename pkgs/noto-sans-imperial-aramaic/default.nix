{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-imperial-aramaic-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosansimperialaramaic/NotoSansImperialAramaic-Regular.ttf?raw=true";
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
