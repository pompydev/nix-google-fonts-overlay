{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "roboto-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/3b947ee2732103ef6132b09d234aecd768d2d83c/apache/roboto/Roboto[wdth,wght].ttf?raw=true";
      name = "Roboto[wdth,wght].ttf";
      sha256 = "9c514b40e644ce46192c5ac340b676669ef5a9837201d4aaa24b23592c73b921";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/3b947ee2732103ef6132b09d234aecd768d2d83c/apache/roboto/Roboto-Italic[wdth,wght].ttf?raw=true";
      name = "Roboto-Italic[wdth,wght].ttf";
      sha256 = "40bbf1a744288a61706c283a27de30633b72508a8f382581c6332555fed74785";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'Roboto[wdth,wght].ttf' $out/share/fonts/truetype/'Roboto[wdth,wght].ttf'
     install -Dm644 'Roboto-Italic[wdth,wght].ttf' $out/share/fonts/truetype/'Roboto-Italic[wdth,wght].ttf'
  '';

  meta = with lib; {
    description = "Roboto";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
