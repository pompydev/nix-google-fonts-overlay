{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "kanit-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/674cdcf5e290b4d29f7b017ad1643e536d1bc372/ofl/kanit/Kanit-Thin.ttf?raw=true";
      name = "Kanit-Thin.ttf";
      sha256 = "740d8a4d92ddae394d13a3caea845c048b6d62b58f9fb92ed4ac0118ed38c083";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/674cdcf5e290b4d29f7b017ad1643e536d1bc372/ofl/kanit/Kanit-ThinItalic.ttf?raw=true";
      name = "Kanit-ThinItalic.ttf";
      sha256 = "6f61a638ba025b495fbf23a05f96af31ae3e9ca710506da123e3d63abdcf7d40";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/674cdcf5e290b4d29f7b017ad1643e536d1bc372/ofl/kanit/Kanit-ExtraLight.ttf?raw=true";
      name = "Kanit-ExtraLight.ttf";
      sha256 = "f90e440b41170f2f75f2930d3273dbe9ed7a5ac49f7dbdc375ba5f8d2e224745";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/674cdcf5e290b4d29f7b017ad1643e536d1bc372/ofl/kanit/Kanit-ExtraLightItalic.ttf?raw=true";
      name = "Kanit-ExtraLightItalic.ttf";
      sha256 = "e62305565471f6ef1139581e2afbcd0b108fc2a8b140052cd06ec2852aad9cf9";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/674cdcf5e290b4d29f7b017ad1643e536d1bc372/ofl/kanit/Kanit-Light.ttf?raw=true";
      name = "Kanit-Light.ttf";
      sha256 = "7c04b0be6011782fcc4c032f4033ef6f6ba1fef99b135ba1ee68b800c53017ec";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/674cdcf5e290b4d29f7b017ad1643e536d1bc372/ofl/kanit/Kanit-LightItalic.ttf?raw=true";
      name = "Kanit-LightItalic.ttf";
      sha256 = "e5cd0a7ce9ce65b7be59287320d247b7627b0a437a6a3bd1174440ceed4af1c6";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/674cdcf5e290b4d29f7b017ad1643e536d1bc372/ofl/kanit/Kanit-Regular.ttf?raw=true";
      name = "Kanit-Regular.ttf";
      sha256 = "27170c049660b2f962d3ed28441fd20f4c743503ca031fec9c2b4542d6c52736";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/674cdcf5e290b4d29f7b017ad1643e536d1bc372/ofl/kanit/Kanit-Italic.ttf?raw=true";
      name = "Kanit-Italic.ttf";
      sha256 = "7cbe69393a7bf948dd49e575369344a907f06b0182e7a618c033c67208abb27d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/674cdcf5e290b4d29f7b017ad1643e536d1bc372/ofl/kanit/Kanit-Medium.ttf?raw=true";
      name = "Kanit-Medium.ttf";
      sha256 = "50a237034244026a7c63fe55e24e0b4298babe363cde043e032075b764c545a2";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/674cdcf5e290b4d29f7b017ad1643e536d1bc372/ofl/kanit/Kanit-MediumItalic.ttf?raw=true";
      name = "Kanit-MediumItalic.ttf";
      sha256 = "266a8044e599ce2feef7dffa8e3ce7648c94927daba20c4838629054633cf8c4";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/674cdcf5e290b4d29f7b017ad1643e536d1bc372/ofl/kanit/Kanit-SemiBold.ttf?raw=true";
      name = "Kanit-SemiBold.ttf";
      sha256 = "67e64baf1a7e6e076435518ff0e6bf25c4d74b98143cd1a2688db906c0abce11";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/674cdcf5e290b4d29f7b017ad1643e536d1bc372/ofl/kanit/Kanit-SemiBoldItalic.ttf?raw=true";
      name = "Kanit-SemiBoldItalic.ttf";
      sha256 = "df1f635f3022306a7f61ed03cdc1a90364f31e19454bd287cffe45f98ca805d0";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/674cdcf5e290b4d29f7b017ad1643e536d1bc372/ofl/kanit/Kanit-Bold.ttf?raw=true";
      name = "Kanit-Bold.ttf";
      sha256 = "5dec5b080dab13de9d2295437c0ff3ec05c9e75587dfc31358c005eb4efa5e70";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/674cdcf5e290b4d29f7b017ad1643e536d1bc372/ofl/kanit/Kanit-BoldItalic.ttf?raw=true";
      name = "Kanit-BoldItalic.ttf";
      sha256 = "194d26ba90b782465bd4653cc5a1cdf7a9bed7b9e271df4f6fb41b5dba359d78";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/674cdcf5e290b4d29f7b017ad1643e536d1bc372/ofl/kanit/Kanit-ExtraBold.ttf?raw=true";
      name = "Kanit-ExtraBold.ttf";
      sha256 = "70082870d1f5bb6ae9faa708572b2c36de3c076caae187edae753f709d0de984";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/674cdcf5e290b4d29f7b017ad1643e536d1bc372/ofl/kanit/Kanit-ExtraBoldItalic.ttf?raw=true";
      name = "Kanit-ExtraBoldItalic.ttf";
      sha256 = "e874a96de66b5340174ddf9c621593280a21e9adb8e07bb1587112de274acad5";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/674cdcf5e290b4d29f7b017ad1643e536d1bc372/ofl/kanit/Kanit-Black.ttf?raw=true";
      name = "Kanit-Black.ttf";
      sha256 = "5d290c2cc9926764bd782aa6abc47a8f55bd64641d0afb56e115ee522698ee7e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/674cdcf5e290b4d29f7b017ad1643e536d1bc372/ofl/kanit/Kanit-BlackItalic.ttf?raw=true";
      name = "Kanit-BlackItalic.ttf";
      sha256 = "7fe3f1d87e33e165eae2d664e42a31faf542d24e431a2e7da36f4e4eee5f8529";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Kanit-Thin.ttf $out/share/fonts/truetype/Kanit-Thin.ttf
     install -Dm644 Kanit-ThinItalic.ttf $out/share/fonts/truetype/Kanit-ThinItalic.ttf
     install -Dm644 Kanit-ExtraLight.ttf $out/share/fonts/truetype/Kanit-ExtraLight.ttf
     install -Dm644 Kanit-ExtraLightItalic.ttf $out/share/fonts/truetype/Kanit-ExtraLightItalic.ttf
     install -Dm644 Kanit-Light.ttf $out/share/fonts/truetype/Kanit-Light.ttf
     install -Dm644 Kanit-LightItalic.ttf $out/share/fonts/truetype/Kanit-LightItalic.ttf
     install -Dm644 Kanit-Regular.ttf $out/share/fonts/truetype/Kanit-Regular.ttf
     install -Dm644 Kanit-Italic.ttf $out/share/fonts/truetype/Kanit-Italic.ttf
     install -Dm644 Kanit-Medium.ttf $out/share/fonts/truetype/Kanit-Medium.ttf
     install -Dm644 Kanit-MediumItalic.ttf $out/share/fonts/truetype/Kanit-MediumItalic.ttf
     install -Dm644 Kanit-SemiBold.ttf $out/share/fonts/truetype/Kanit-SemiBold.ttf
     install -Dm644 Kanit-SemiBoldItalic.ttf $out/share/fonts/truetype/Kanit-SemiBoldItalic.ttf
     install -Dm644 Kanit-Bold.ttf $out/share/fonts/truetype/Kanit-Bold.ttf
     install -Dm644 Kanit-BoldItalic.ttf $out/share/fonts/truetype/Kanit-BoldItalic.ttf
     install -Dm644 Kanit-ExtraBold.ttf $out/share/fonts/truetype/Kanit-ExtraBold.ttf
     install -Dm644 Kanit-ExtraBoldItalic.ttf $out/share/fonts/truetype/Kanit-ExtraBoldItalic.ttf
     install -Dm644 Kanit-Black.ttf $out/share/fonts/truetype/Kanit-Black.ttf
     install -Dm644 Kanit-BlackItalic.ttf $out/share/fonts/truetype/Kanit-BlackItalic.ttf
  '';

  meta = with lib; {
    description = "Kanit";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
