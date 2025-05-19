{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-kannada-ui-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosanskannadaui/NotoSansKannadaUI%5Bwdth,wght%5D.ttf?raw=true";
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
     install -Dm644 NotoSansKannadaUI_wdth,wght_.ttf $out/share/fonts/truetype/NotoSansKannadaUI_wdth,wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Kannada UI";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
