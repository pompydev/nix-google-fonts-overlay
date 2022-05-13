{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "inconsolata-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/0f203e3740b5eb77e0b179dff1e5869482676782/ofl/inconsolata/Inconsolata[wdth,wght].ttf?raw=true";
      name = "Inconsolata[wdth,wght].ttf";
      sha256 = "23ded25b447074d00659392bf9b1123d89df55cb07b0ad9bfef3366d199b5fcb";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'Inconsolata[wdth,wght].ttf' $out/share/fonts/truetype/'Inconsolata[wdth,wght].ttf'
  '';

  meta = with lib; {
    description = "Inconsolata";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
