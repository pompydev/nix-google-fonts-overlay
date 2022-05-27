{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "roboto-${version}";
  version = "2022-05-23-211740";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/3b947ee2732103ef6132b09d234aecd768d2d83c/apache/roboto/Roboto%5Bwdth,wght%5D.ttf?raw=true";
      name = "Roboto_wdth,wght_.ttf";
      sha256 = "9c514b40e644ce46192c5ac340b676669ef5a9837201d4aaa24b23592c73b921";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/3b947ee2732103ef6132b09d234aecd768d2d83c/apache/roboto/Roboto-Italic%5Bwdth,wght%5D.ttf?raw=true";
      name = "Roboto-Italic_wdth,wght_.ttf";
      sha256 = "40bbf1a744288a61706c283a27de30633b72508a8f382581c6332555fed74785";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Roboto_wdth,wght_.ttf $out/share/fonts/truetype/Roboto_wdth,wght_.ttf
     install -Dm644 Roboto-Italic_wdth,wght_.ttf $out/share/fonts/truetype/Roboto-Italic_wdth,wght_.ttf
  '';

  meta = with lib; {
    description = "Roboto";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
