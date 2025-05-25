{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "gemunu-libre-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/gemunulibre/GemunuLibre%5Bwght%5D.ttf?raw=true";
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
