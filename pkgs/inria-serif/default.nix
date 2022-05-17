{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "inria-serif-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a2b3b38b974b54b30781e8a76feebdb36a3b4bd1/ofl/inriaserif/InriaSerif-Light.ttf?raw=true";
      name = "InriaSerif-Light.ttf";
      sha256 = "84de09ba2fb616be390214a5283aaaf55b89e50594bd7efcc438aff69c4e9927";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a2b3b38b974b54b30781e8a76feebdb36a3b4bd1/ofl/inriaserif/InriaSerif-LightItalic.ttf?raw=true";
      name = "InriaSerif-LightItalic.ttf";
      sha256 = "76dad25026919a84d9b65d3758f53099c1917cf15cc45e0e745b91a215ee9f37";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a2b3b38b974b54b30781e8a76feebdb36a3b4bd1/ofl/inriaserif/InriaSerif-Regular.ttf?raw=true";
      name = "InriaSerif-Regular.ttf";
      sha256 = "576ba277e3ea1bb7de43724d14c989de92e35eeae204210b0c2a9e7b10dc23fc";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a2b3b38b974b54b30781e8a76feebdb36a3b4bd1/ofl/inriaserif/InriaSerif-Italic.ttf?raw=true";
      name = "InriaSerif-Italic.ttf";
      sha256 = "ab8c4878366145598f6421dc970ef40de27d25edf02fa9628b5f2cd93e4d54f3";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a2b3b38b974b54b30781e8a76feebdb36a3b4bd1/ofl/inriaserif/InriaSerif-Bold.ttf?raw=true";
      name = "InriaSerif-Bold.ttf";
      sha256 = "35ff98e0c58cb27a6ec045b25072d99de57d6ea03f12c8dc0963fcbed0df2d91";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a2b3b38b974b54b30781e8a76feebdb36a3b4bd1/ofl/inriaserif/InriaSerif-BoldItalic.ttf?raw=true";
      name = "InriaSerif-BoldItalic.ttf";
      sha256 = "640772d92df913501f961382215b344eae71c1d54a1a02fd150898fe5de46bfd";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 InriaSerif-Light.ttf $out/share/fonts/truetype/InriaSerif-Light.ttf
     install -Dm644 InriaSerif-LightItalic.ttf $out/share/fonts/truetype/InriaSerif-LightItalic.ttf
     install -Dm644 InriaSerif-Regular.ttf $out/share/fonts/truetype/InriaSerif-Regular.ttf
     install -Dm644 InriaSerif-Italic.ttf $out/share/fonts/truetype/InriaSerif-Italic.ttf
     install -Dm644 InriaSerif-Bold.ttf $out/share/fonts/truetype/InriaSerif-Bold.ttf
     install -Dm644 InriaSerif-BoldItalic.ttf $out/share/fonts/truetype/InriaSerif-BoldItalic.ttf
  '';

  meta = with lib; {
    description = "Inria Serif";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
