{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "blinker-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9d2830d30a64df531ad94bcab50a3c03a87d92f4/ofl/blinker/Blinker-Thin.ttf?raw=true";
      name = "Blinker-Thin.ttf";
      sha256 = "3e06087e0f62496ac99f14de72d4bee718ef28b9ad824ebc1d79fc8956d30288";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9d2830d30a64df531ad94bcab50a3c03a87d92f4/ofl/blinker/Blinker-ExtraLight.ttf?raw=true";
      name = "Blinker-ExtraLight.ttf";
      sha256 = "99070de9779f72df4e836b8dff77aba1db6102c41f093d200c5d77f336b16174";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ff8e6172b597e35333d00cc99b8cd446572891f4/ofl/blinker/Blinker-Light.ttf?raw=true";
      name = "Blinker-Light.ttf";
      sha256 = "6b8a38218155b1fb37bfdc10d5ff2ef815372ed99aeef3c4e5aebb39ec8d471d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9d2830d30a64df531ad94bcab50a3c03a87d92f4/ofl/blinker/Blinker-Regular.ttf?raw=true";
      name = "Blinker-Regular.ttf";
      sha256 = "2f2da3988c84378f11568885c970c442a7263bce637bd5bd4b02ec064c5753c0";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9d2830d30a64df531ad94bcab50a3c03a87d92f4/ofl/blinker/Blinker-SemiBold.ttf?raw=true";
      name = "Blinker-SemiBold.ttf";
      sha256 = "a9a701eb18cbd5f786f28f986c16895ffc0d0337e4a9a63131b619d9542e07d4";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9d2830d30a64df531ad94bcab50a3c03a87d92f4/ofl/blinker/Blinker-Bold.ttf?raw=true";
      name = "Blinker-Bold.ttf";
      sha256 = "da7c3e42b502b5445263d492b5adcdff01e656d87beddf8cc5bae5657898664a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9d2830d30a64df531ad94bcab50a3c03a87d92f4/ofl/blinker/Blinker-ExtraBold.ttf?raw=true";
      name = "Blinker-ExtraBold.ttf";
      sha256 = "2aadb3bf884c0f60c1fccf861ccc4c31ae4ff42c87b23444cd979246d6863129";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9d2830d30a64df531ad94bcab50a3c03a87d92f4/ofl/blinker/Blinker-Black.ttf?raw=true";
      name = "Blinker-Black.ttf";
      sha256 = "9404723f3a1a2c600c2b1ca8ba3bdaa1fcc348cdcaa94301181f97e368cfff49";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Blinker-Thin.ttf $out/share/fonts/truetype/Blinker-Thin.ttf
     install -Dm644 Blinker-ExtraLight.ttf $out/share/fonts/truetype/Blinker-ExtraLight.ttf
     install -Dm644 Blinker-Light.ttf $out/share/fonts/truetype/Blinker-Light.ttf
     install -Dm644 Blinker-Regular.ttf $out/share/fonts/truetype/Blinker-Regular.ttf
     install -Dm644 Blinker-SemiBold.ttf $out/share/fonts/truetype/Blinker-SemiBold.ttf
     install -Dm644 Blinker-Bold.ttf $out/share/fonts/truetype/Blinker-Bold.ttf
     install -Dm644 Blinker-ExtraBold.ttf $out/share/fonts/truetype/Blinker-ExtraBold.ttf
     install -Dm644 Blinker-Black.ttf $out/share/fonts/truetype/Blinker-Black.ttf
  '';

  meta = with lib; {
    description = "Blinker";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
