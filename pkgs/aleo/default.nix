{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "aleo-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/aleo/Aleo%5Bwght%5D.ttf?raw=true";
      name = "Aleo_wght_.ttf";
      sha256 = "62b6cb49b7b087b341f0307ea3bc871a9690d8947691206ab025d149b8f6ed6f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/aleo/Aleo-Italic%5Bwght%5D.ttf?raw=true";
      name = "Aleo-Italic_wght_.ttf";
      sha256 = "9b4c074d9f3e662ef57bbef82efb7b1bb5f757d579c91c4c0b831319221d6f8c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Aleo_wght_.ttf $out/share/fonts/truetype/Aleo_wght_.ttf
     install -Dm644 Aleo-Italic_wght_.ttf $out/share/fonts/truetype/Aleo-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Aleo";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
