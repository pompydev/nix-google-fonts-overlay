{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "gentium-plus-${version}";
  version = "2022-05-13-120754";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c4bd34c84ac5e8d93e250a12648341a396eab736/ofl/gentiumplus/GentiumPlus-Regular.ttf?raw=true";
      name = "GentiumPlus-Regular.ttf";
      sha256 = "845e06bb4673a908a5f3b3b4ac9f38841750a07faa9aa45bfcb5796893346f0b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c4bd34c84ac5e8d93e250a12648341a396eab736/ofl/gentiumplus/GentiumPlus-Italic.ttf?raw=true";
      name = "GentiumPlus-Italic.ttf";
      sha256 = "18df1f3ddf09cf72338f25c45ca0d1922fb5e86cdd748522dbd6bede4fb1f99d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c4bd34c84ac5e8d93e250a12648341a396eab736/ofl/gentiumplus/GentiumPlus-Bold.ttf?raw=true";
      name = "GentiumPlus-Bold.ttf";
      sha256 = "716c4a16887550b13f40b408df5dad6c410c72a00867c5fe802a9ed483e3fb8d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c4bd34c84ac5e8d93e250a12648341a396eab736/ofl/gentiumplus/GentiumPlus-BoldItalic.ttf?raw=true";
      name = "GentiumPlus-BoldItalic.ttf";
      sha256 = "35e7ad6591694a832de59df1899bccc88e0af8ad5fff20533b63751747851c71";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 GentiumPlus-Regular.ttf $out/share/fonts/truetype/GentiumPlus-Regular.ttf
     install -Dm644 GentiumPlus-Italic.ttf $out/share/fonts/truetype/GentiumPlus-Italic.ttf
     install -Dm644 GentiumPlus-Bold.ttf $out/share/fonts/truetype/GentiumPlus-Bold.ttf
     install -Dm644 GentiumPlus-BoldItalic.ttf $out/share/fonts/truetype/GentiumPlus-BoldItalic.ttf
  '';

  meta = with lib; {
    description = "Gentium Plus";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
