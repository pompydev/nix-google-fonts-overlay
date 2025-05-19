{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "shippori-mincho-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/shipporimincho/ShipporiMincho-Regular.ttf?raw=true";
      name = "ShipporiMincho-Regular.ttf";
      sha256 = "769b5269f0f9bc6534b352c0e6bd856a566e03ff788f107191c2d835863570b2";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/shipporimincho/ShipporiMincho-Medium.ttf?raw=true";
      name = "ShipporiMincho-Medium.ttf";
      sha256 = "700e505afc4cded2338eba29478a041e04c1c2ea5114fbb3e0b04e76c302c5d8";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/shipporimincho/ShipporiMincho-SemiBold.ttf?raw=true";
      name = "ShipporiMincho-SemiBold.ttf";
      sha256 = "bc7925544894a91466449adb73c6d943f50c3e53eb1c74d0673fe2dbafcd4d2d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/shipporimincho/ShipporiMincho-Bold.ttf?raw=true";
      name = "ShipporiMincho-Bold.ttf";
      sha256 = "63bc4eddc74793f671c3ab827c5175e773ffbe569d0bf50ee65375ea9e3bc286";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/shipporimincho/ShipporiMincho-ExtraBold.ttf?raw=true";
      name = "ShipporiMincho-ExtraBold.ttf";
      sha256 = "bdb787644b4b347e9a7efdd576f0d16ee4528cc9b5c86d23e06fa1a14ae0444c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ShipporiMincho-Regular.ttf $out/share/fonts/truetype/ShipporiMincho-Regular.ttf
     install -Dm644 ShipporiMincho-Medium.ttf $out/share/fonts/truetype/ShipporiMincho-Medium.ttf
     install -Dm644 ShipporiMincho-SemiBold.ttf $out/share/fonts/truetype/ShipporiMincho-SemiBold.ttf
     install -Dm644 ShipporiMincho-Bold.ttf $out/share/fonts/truetype/ShipporiMincho-Bold.ttf
     install -Dm644 ShipporiMincho-ExtraBold.ttf $out/share/fonts/truetype/ShipporiMincho-ExtraBold.ttf
  '';

  meta = with lib; {
    description = "Shippori Mincho";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
