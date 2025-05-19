{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ruwudu-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/ruwudu/Ruwudu-Regular.ttf?raw=true";
      name = "Ruwudu-Regular.ttf";
      sha256 = "ed5b134e7f389eecfdabc6bbbf9605177fa8b5b9984c8b24edbec908623d2c3b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/ruwudu/Ruwudu-Medium.ttf?raw=true";
      name = "Ruwudu-Medium.ttf";
      sha256 = "11688c54f825b293e6554c44a645ffa863a04331f3abee3dee18711a01719a8e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/ruwudu/Ruwudu-SemiBold.ttf?raw=true";
      name = "Ruwudu-SemiBold.ttf";
      sha256 = "13f4e5c44f184bf9432cc4f4121e24853a3b81026a4223d113042710e361041d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/ruwudu/Ruwudu-Bold.ttf?raw=true";
      name = "Ruwudu-Bold.ttf";
      sha256 = "7f7611d534aea674b960e0b586d1f594f3975b4db3fff5f55c1b92484a34cf78";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Ruwudu-Regular.ttf $out/share/fonts/truetype/Ruwudu-Regular.ttf
     install -Dm644 Ruwudu-Medium.ttf $out/share/fonts/truetype/Ruwudu-Medium.ttf
     install -Dm644 Ruwudu-SemiBold.ttf $out/share/fonts/truetype/Ruwudu-SemiBold.ttf
     install -Dm644 Ruwudu-Bold.ttf $out/share/fonts/truetype/Ruwudu-Bold.ttf
  '';

  meta = with lib; {
    description = "Ruwudu";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
