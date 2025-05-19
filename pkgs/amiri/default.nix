{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "amiri-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/amiri/Amiri-Regular.ttf?raw=true";
      name = "Amiri-Regular.ttf";
      sha256 = "d265852fa52d788621d6b65fefe5e0161eea0d808ca882d38eaefbad2c2136b0";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/amiri/Amiri-Italic.ttf?raw=true";
      name = "Amiri-Italic.ttf";
      sha256 = "2775df4c4db5aeb073d485a027ffb960afd592c8f23df8653387af80696b13d4";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/amiri/Amiri-Bold.ttf?raw=true";
      name = "Amiri-Bold.ttf";
      sha256 = "efb47591da7ea4cd871037b1a88b55723fc69757454c8069b1e131d572c34130";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/amiri/Amiri-BoldItalic.ttf?raw=true";
      name = "Amiri-BoldItalic.ttf";
      sha256 = "64119103be65656d26e5a09aed334d031afbcbfb34cacc6831432d2b3e481bd5";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Amiri-Regular.ttf $out/share/fonts/truetype/Amiri-Regular.ttf
     install -Dm644 Amiri-Italic.ttf $out/share/fonts/truetype/Amiri-Italic.ttf
     install -Dm644 Amiri-Bold.ttf $out/share/fonts/truetype/Amiri-Bold.ttf
     install -Dm644 Amiri-BoldItalic.ttf $out/share/fonts/truetype/Amiri-BoldItalic.ttf
  '';

  meta = with lib; {
    description = "Amiri";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
