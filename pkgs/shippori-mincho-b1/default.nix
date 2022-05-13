{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "shippori-mincho-b1-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/01fe2d31ea04a7d2d294f0698c16544b63bbc87d/ofl/shipporiminchob1/ShipporiMinchoB1-Regular.ttf?raw=true";
      name = "ShipporiMinchoB1-Regular.ttf";
      sha256 = "89403e4b2a9ca0db9f832b893cfbfd90506c7c674cd640ba8a0ee128c34de7a4";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/01fe2d31ea04a7d2d294f0698c16544b63bbc87d/ofl/shipporiminchob1/ShipporiMinchoB1-Medium.ttf?raw=true";
      name = "ShipporiMinchoB1-Medium.ttf";
      sha256 = "0712348124729e30507a9ed9d7c8939125f13605954596acfe0ec4a6341e3b9d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/01fe2d31ea04a7d2d294f0698c16544b63bbc87d/ofl/shipporiminchob1/ShipporiMinchoB1-SemiBold.ttf?raw=true";
      name = "ShipporiMinchoB1-SemiBold.ttf";
      sha256 = "2d0dfceb662d522c9dd643f6822e9af2def6b0a0186ed5cb303463d2ed8f5c06";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/01fe2d31ea04a7d2d294f0698c16544b63bbc87d/ofl/shipporiminchob1/ShipporiMinchoB1-Bold.ttf?raw=true";
      name = "ShipporiMinchoB1-Bold.ttf";
      sha256 = "d20f3981afb8bceda5fdf8f0fb29ba51eb21518644612ccd8a183e5bd433e25a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/01fe2d31ea04a7d2d294f0698c16544b63bbc87d/ofl/shipporiminchob1/ShipporiMinchoB1-ExtraBold.ttf?raw=true";
      name = "ShipporiMinchoB1-ExtraBold.ttf";
      sha256 = "bee99a242f32128e8d6a4acff2b3f1742cd42ea90748758e6e10456871887e76";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ShipporiMinchoB1-Regular.ttf $out/share/fonts/truetype/ShipporiMinchoB1-Regular.ttf
     install -Dm644 ShipporiMinchoB1-Medium.ttf $out/share/fonts/truetype/ShipporiMinchoB1-Medium.ttf
     install -Dm644 ShipporiMinchoB1-SemiBold.ttf $out/share/fonts/truetype/ShipporiMinchoB1-SemiBold.ttf
     install -Dm644 ShipporiMinchoB1-Bold.ttf $out/share/fonts/truetype/ShipporiMinchoB1-Bold.ttf
     install -Dm644 ShipporiMinchoB1-ExtraBold.ttf $out/share/fonts/truetype/ShipporiMinchoB1-ExtraBold.ttf
  '';

  meta = with lib; {
    description = "Shippori Mincho B1";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
