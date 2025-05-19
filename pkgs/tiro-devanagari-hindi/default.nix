{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "tiro-devanagari-hindi-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/tirodevanagarihindi/TiroDevanagariHindi-Regular.ttf?raw=true";
      name = "TiroDevanagariHindi-Regular.ttf";
      sha256 = "d2abcb4d352f0bfab91632df5d9c8173882073c182e662fa731a5a738e6681d7";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/tirodevanagarihindi/TiroDevanagariHindi-Italic.ttf?raw=true";
      name = "TiroDevanagariHindi-Italic.ttf";
      sha256 = "eed07aca7291e34fa2c4f3e48be325b261f60516ecf835610fee30dade0f78ec";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 TiroDevanagariHindi-Regular.ttf $out/share/fonts/truetype/TiroDevanagariHindi-Regular.ttf
     install -Dm644 TiroDevanagariHindi-Italic.ttf $out/share/fonts/truetype/TiroDevanagariHindi-Italic.ttf
  '';

  meta = with lib; {
    description = "Tiro Devanagari Hindi";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
