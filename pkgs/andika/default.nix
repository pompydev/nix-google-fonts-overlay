{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "andika-${version}";
  version = "2022-05-23-195233";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f5c0a9e3191755ef64b257bb9a469e56eb3f7542/ofl/andika/Andika-Regular.ttf?raw=true";
      name = "Andika-Regular.ttf";
      sha256 = "202b96b1f174a4a43baefe885b40dacacb81786755efd08ed4b7704e79c45515";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f5c0a9e3191755ef64b257bb9a469e56eb3f7542/ofl/andika/Andika-Italic.ttf?raw=true";
      name = "Andika-Italic.ttf";
      sha256 = "6a4a0dd26d28f577b51dd6afb5acf6fd91ab21694e25649c270a32179bb52a62";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f5c0a9e3191755ef64b257bb9a469e56eb3f7542/ofl/andika/Andika-Bold.ttf?raw=true";
      name = "Andika-Bold.ttf";
      sha256 = "4361126189a2d0e0da66999352db58aaf1b4ca940faf8a8239d725f8303d890d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f5c0a9e3191755ef64b257bb9a469e56eb3f7542/ofl/andika/Andika-BoldItalic.ttf?raw=true";
      name = "Andika-BoldItalic.ttf";
      sha256 = "2d000f8791a1827c0c4d411e9f4593c4fc2db0fdbb868bb1f863593b3d3968e6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Andika-Regular.ttf $out/share/fonts/truetype/Andika-Regular.ttf
     install -Dm644 Andika-Italic.ttf $out/share/fonts/truetype/Andika-Italic.ttf
     install -Dm644 Andika-Bold.ttf $out/share/fonts/truetype/Andika-Bold.ttf
     install -Dm644 Andika-BoldItalic.ttf $out/share/fonts/truetype/Andika-BoldItalic.ttf
  '';

  meta = with lib; {
    description = "Andika";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
