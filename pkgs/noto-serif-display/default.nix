{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-display-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notoserifdisplay/NotoSerifDisplay%5Bwdth,wght%5D.ttf?raw=true";
      name = "NotoSerifDisplay_wdth,wght_.ttf";
      sha256 = "4b661adcf6a5d38bf5befdc4d976e8a7238a4aeb57e62c1c1a67775380a09df9";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notoserifdisplay/NotoSerifDisplay-Italic%5Bwdth,wght%5D.ttf?raw=true";
      name = "NotoSerifDisplay-Italic_wdth,wght_.ttf";
      sha256 = "daad4d314708839a5c343f26e75467edf6c05a3a726502c98974dd3e240e6516";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSerifDisplay_wdth-wght_.ttf $out/share/fonts/truetype/NotoSerifDisplay_wdth-wght_.ttf
     install -Dm644 NotoSerifDisplay-Italic_wdth-wght_.ttf $out/share/fonts/truetype/NotoSerifDisplay-Italic_wdth-wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Serif Display";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
