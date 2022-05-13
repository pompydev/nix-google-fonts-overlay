{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-thai-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notoserifthai/NotoSerifThai[wdth,wght].ttf?raw=true";
      name = "NotoSerifThai[wdth,wght].ttf";
      sha256 = "3b8a88ed2236f94f69f82a7414296e01bbe762f0482ef5d3c5b395867e2a51e5";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'NotoSerifThai[wdth,wght].ttf' $out/share/fonts/truetype/'NotoSerifThai[wdth,wght].ttf'
  '';

  meta = with lib; {
    description = "Noto Serif Thai";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
