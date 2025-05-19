{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "courier-prime-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/courierprime/CourierPrime-Regular.ttf?raw=true";
      name = "CourierPrime-Regular.ttf";
      sha256 = "72f793376f8e2841656bf21d77a5de010f2929bd6956a22ee848ad0c7eb978af";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/courierprime/CourierPrime-Italic.ttf?raw=true";
      name = "CourierPrime-Italic.ttf";
      sha256 = "f1b9a5829789f7e56432a9f3bc7665ef4531dbba1c112639e48bef39621a006b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/courierprime/CourierPrime-Bold.ttf?raw=true";
      name = "CourierPrime-Bold.ttf";
      sha256 = "ff1f38786c849d1c41fa8e447960abdb2bd75fdfb0cfcdeb524fad65a5af3638";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/courierprime/CourierPrime-BoldItalic.ttf?raw=true";
      name = "CourierPrime-BoldItalic.ttf";
      sha256 = "3355273f3ea6d6362658f9564f4e83d59e156cf1a182e3c1592b5c5943627dcc";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 CourierPrime-Regular.ttf $out/share/fonts/truetype/CourierPrime-Regular.ttf
     install -Dm644 CourierPrime-Italic.ttf $out/share/fonts/truetype/CourierPrime-Italic.ttf
     install -Dm644 CourierPrime-Bold.ttf $out/share/fonts/truetype/CourierPrime-Bold.ttf
     install -Dm644 CourierPrime-BoldItalic.ttf $out/share/fonts/truetype/CourierPrime-BoldItalic.ttf
  '';

  meta = with lib; {
    description = "Courier Prime";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
