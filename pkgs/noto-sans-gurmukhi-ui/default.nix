{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-gurmukhi-ui-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansgurmukhiui/NotoSansGurmukhiUI[wdth,wght].ttf?raw=true";
      name = "NotoSansGurmukhiUI[wdth,wght].ttf";
      sha256 = "3615afc43386f768ac15335349e8bf810bb811614f6b42252eca1fc34849692b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'NotoSansGurmukhiUI[wdth,wght].ttf' $out/share/fonts/truetype/'NotoSansGurmukhiUI[wdth,wght].ttf'
  '';

  meta = with lib; {
    description = "Noto Sans Gurmukhi UI";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
