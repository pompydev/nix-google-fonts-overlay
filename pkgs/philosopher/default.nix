{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "philosopher-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/philosopher/Philosopher-Regular.ttf?raw=true";
      name = "Philosopher-Regular.ttf";
      sha256 = "e1cba0b5003b5694f1d6cc0fbe629f78362ad38a9ffd4d0cb7abfd9698a575ed";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/philosopher/Philosopher-Italic.ttf?raw=true";
      name = "Philosopher-Italic.ttf";
      sha256 = "1ec5f0cc140a5daefca74692c1693c224aaac6936b8eda16598d56eba94cf008";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/philosopher/Philosopher-Bold.ttf?raw=true";
      name = "Philosopher-Bold.ttf";
      sha256 = "2277c78b95657274b949f40b64b58d18fe7bbe0ec968c104d38906ec700024ea";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/philosopher/Philosopher-BoldItalic.ttf?raw=true";
      name = "Philosopher-BoldItalic.ttf";
      sha256 = "a8abb9341d1dc574d301edebf9ad8ea68dd0ae61ca1fa640b9bbdb5f388013c4";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Philosopher-Regular.ttf $out/share/fonts/truetype/Philosopher-Regular.ttf
     install -Dm644 Philosopher-Italic.ttf $out/share/fonts/truetype/Philosopher-Italic.ttf
     install -Dm644 Philosopher-Bold.ttf $out/share/fonts/truetype/Philosopher-Bold.ttf
     install -Dm644 Philosopher-BoldItalic.ttf $out/share/fonts/truetype/Philosopher-BoldItalic.ttf
  '';

  meta = with lib; {
    description = "Philosopher";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
