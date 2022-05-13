{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-lao-ui-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosanslaoui/NotoSansLaoUI[wdth,wght].ttf?raw=true";
      name = "NotoSansLaoUI[wdth,wght].ttf";
      sha256 = "beabd7830fe6d6b1e7f622b7212595aa5805cfd7f4fc69a2a769362b3086b7d6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'NotoSansLaoUI[wdth,wght].ttf' $out/share/fonts/truetype/'NotoSansLaoUI[wdth,wght].ttf'
  '';

  meta = with lib; {
    description = "Noto Sans Lao UI";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
