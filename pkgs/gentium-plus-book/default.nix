{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "gentium-plus-book-${version}";
  version = "2022-05-13-121353";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/2b96fb530ee4e75b2dd82672092b73dad4c48449/ofl/gentiumplusbook/GentiumBookPlus-Regular.ttf?raw=true";
      name = "GentiumBookPlus-Regular.ttf";
      sha256 = "7f321bee432b44035a42f2b0ab4eabb9a45d52655ea6ce9cc6fbcec5b06999c9";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/2b96fb530ee4e75b2dd82672092b73dad4c48449/ofl/gentiumplusbook/GentiumBookPlus-Italic.ttf?raw=true";
      name = "GentiumBookPlus-Italic.ttf";
      sha256 = "8c578c2cf40a7562aa012f3917e621a69317f15eabac86d0be379ecf05356a4a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/2b96fb530ee4e75b2dd82672092b73dad4c48449/ofl/gentiumplusbook/GentiumBookPlus-Bold.ttf?raw=true";
      name = "GentiumBookPlus-Bold.ttf";
      sha256 = "eafbb2df4c8f42e5c122d898e12e0719e0dfc497918590da8add5348e328c19e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/2b96fb530ee4e75b2dd82672092b73dad4c48449/ofl/gentiumplusbook/GentiumBookPlus-BoldItalic.ttf?raw=true";
      name = "GentiumBookPlus-BoldItalic.ttf";
      sha256 = "08331dbc47a76df0d4181f153fce14e86db0e1a7b389b59ab73ef8d1fce19201";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 GentiumBookPlus-Regular.ttf $out/share/fonts/truetype/GentiumBookPlus-Regular.ttf
     install -Dm644 GentiumBookPlus-Italic.ttf $out/share/fonts/truetype/GentiumBookPlus-Italic.ttf
     install -Dm644 GentiumBookPlus-Bold.ttf $out/share/fonts/truetype/GentiumBookPlus-Bold.ttf
     install -Dm644 GentiumBookPlus-BoldItalic.ttf $out/share/fonts/truetype/GentiumBookPlus-BoldItalic.ttf
  '';

  meta = with lib; {
    description = "Gentium Plus Book";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
