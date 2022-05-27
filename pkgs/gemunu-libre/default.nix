{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "gemunu-libre-${version}";
  version = "2022-05-23-214203";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/77b7a8700e8ed0d45b9f2ecbfd378ac3a97185ed/ofl/gemunulibre/GemunuLibre%5Bwght%5D.ttf?raw=true";
      name = "GemunuLibre_wght_.ttf";
      sha256 = "e723b7f44b06b2443b44eb734f32794eae64915029842d2b2187eadd74b377a6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 GemunuLibre_wght_.ttf $out/share/fonts/truetype/GemunuLibre_wght_.ttf
  '';

  meta = with lib; {
    description = "Gemunu Libre";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
