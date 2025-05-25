{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-kannada-ui-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosanskannadaui/NotoSansKannadaUI%5Bwdth,wght%5D.ttf?raw=true";
      name = "NotoSansKannadaUI_wdth,wght_.ttf";
      sha256 = "a0b35c3ff628b3da3df104a1d5c83408ed50ce33168976704a298936a2900329";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansKannadaUI_wdth-wght_.ttf $out/share/fonts/truetype/NotoSansKannadaUI_wdth-wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Kannada UI";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
