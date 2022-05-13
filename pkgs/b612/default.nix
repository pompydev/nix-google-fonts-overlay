{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "b612-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/2e8cd558a6a31683ba48900360aa17b6a9380347/ofl/b612/B612-Regular.ttf?raw=true";
      name = "B612-Regular.ttf";
      sha256 = "139dce659100a83bf95b48474696e448bee95631ef84fd3d0437ced2bf33cf73";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/2e8cd558a6a31683ba48900360aa17b6a9380347/ofl/b612/B612-Italic.ttf?raw=true";
      name = "B612-Italic.ttf";
      sha256 = "57fd8a0d3c8baf066f21c0a3034af277887a0b17b8c18cbbcc1c642640dd149f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/2e8cd558a6a31683ba48900360aa17b6a9380347/ofl/b612/B612-Bold.ttf?raw=true";
      name = "B612-Bold.ttf";
      sha256 = "91749541ac7b2c328b58832b7e2c4df809d7e2ba38d62a3a5aa3f8e38b271814";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/2e8cd558a6a31683ba48900360aa17b6a9380347/ofl/b612/B612-BoldItalic.ttf?raw=true";
      name = "B612-BoldItalic.ttf";
      sha256 = "5911fe0ae69264fb74b2956fc66c616580cd392b47f29335fa68ce5db47a4d2f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 B612-Regular.ttf $out/share/fonts/truetype/B612-Regular.ttf
     install -Dm644 B612-Italic.ttf $out/share/fonts/truetype/B612-Italic.ttf
     install -Dm644 B612-Bold.ttf $out/share/fonts/truetype/B612-Bold.ttf
     install -Dm644 B612-BoldItalic.ttf $out/share/fonts/truetype/B612-BoldItalic.ttf
  '';

  meta = with lib; {
    description = "B612";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
