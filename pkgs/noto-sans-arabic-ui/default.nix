{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-arabic-ui-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansarabicui/NotoSansArabicUI[wdth,wght].ttf?raw=true";
      name = "NotoSansArabicUI[wdth,wght].ttf";
      sha256 = "2d47090f7a3de2fd01ba8aff9a775263b3ab70a46cd2a6bfe3d1c3e1dd89ffe5";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'NotoSansArabicUI[wdth,wght].ttf' $out/share/fonts/truetype/'NotoSansArabicUI[wdth,wght].ttf'
  '';

  meta = with lib; {
    description = "Noto Sans Arabic UI";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
