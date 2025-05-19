{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "chivo-mono-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/chivomono/ChivoMono%5Bwght%5D.ttf?raw=true";
      name = "ChivoMono_wght_.ttf";
      sha256 = "725256f30b7b1b25dd001a96ff8d4a23773197bb886cd847a97ff8eabc9c1d9d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/chivomono/ChivoMono-Italic%5Bwght%5D.ttf?raw=true";
      name = "ChivoMono-Italic_wght_.ttf";
      sha256 = "e6c3e5469d99fee864414845d95ef6aa2fb166121bddd7486d6958c4a54e3aea";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ChivoMono_wght_.ttf $out/share/fonts/truetype/ChivoMono_wght_.ttf
     install -Dm644 ChivoMono-Italic_wght_.ttf $out/share/fonts/truetype/ChivoMono-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Chivo Mono";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
