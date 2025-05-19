{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-nastaliq-urdu-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notonastaliqurdu/NotoNastaliqUrdu%5Bwght%5D.ttf?raw=true";
      name = "NotoNastaliqUrdu_wght_.ttf";
      sha256 = "98a4787f34eb6fde57fb9a1121a8f216301196ab0da98ea110cad581be8abbcd";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoNastaliqUrdu_wght_.ttf $out/share/fonts/truetype/NotoNastaliqUrdu_wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Nastaliq Urdu";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
