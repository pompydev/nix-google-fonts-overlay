{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-display-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notoserifdisplay/NotoSerifDisplay[wdth,wght].ttf?raw=true";
      name = "NotoSerifDisplay[wdth,wght].ttf";
      sha256 = "4b661adcf6a5d38bf5befdc4d976e8a7238a4aeb57e62c1c1a67775380a09df9";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notoserifdisplay/NotoSerifDisplay-Italic[wdth,wght].ttf?raw=true";
      name = "NotoSerifDisplay-Italic[wdth,wght].ttf";
      sha256 = "daad4d314708839a5c343f26e75467edf6c05a3a726502c98974dd3e240e6516";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'NotoSerifDisplay[wdth,wght].ttf' $out/share/fonts/truetype/'NotoSerifDisplay[wdth,wght].ttf'
     install -Dm644 'NotoSerifDisplay-Italic[wdth,wght].ttf' $out/share/fonts/truetype/'NotoSerifDisplay-Italic[wdth,wght].ttf'
  '';

  meta = with lib; {
    description = "Noto Serif Display";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
