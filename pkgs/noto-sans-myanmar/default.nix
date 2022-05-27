{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-myanmar-${version}";
  version = "2022-05-24-075352";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansmyanmar/NotoSansMyanmar-Thin.ttf?raw=true";
      name = "NotoSansMyanmar-Thin.ttf";
      sha256 = "a5d86599d6c6fc29fb04331e05678127ebd6c66f760b06776f417f19ea7e4699";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansmyanmar/NotoSansMyanmar-ExtraLight.ttf?raw=true";
      name = "NotoSansMyanmar-ExtraLight.ttf";
      sha256 = "fbf84bef9433ab2c14d26ae9bce2dcde062acfe8bb23805543b8ffbea60d4f63";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansmyanmar/NotoSansMyanmar-Light.ttf?raw=true";
      name = "NotoSansMyanmar-Light.ttf";
      sha256 = "8a34301a5e62c5b882620264bcd0f400b1c54986c04ffbde14f151c1afa35461";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansmyanmar/NotoSansMyanmar-Regular.ttf?raw=true";
      name = "NotoSansMyanmar-Regular.ttf";
      sha256 = "3fe9a4babc12081adc979e0313433e6ec85bb3ad069681c23ee8d8ea8b91332b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansmyanmar/NotoSansMyanmar-Medium.ttf?raw=true";
      name = "NotoSansMyanmar-Medium.ttf";
      sha256 = "6ce1bc15709f1c521abc13552aa8e77627dbf15e112ee4f7b814d344c032c557";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansmyanmar/NotoSansMyanmar-SemiBold.ttf?raw=true";
      name = "NotoSansMyanmar-SemiBold.ttf";
      sha256 = "cf5f2e7ec9d98e0ddc451ca9644fc6ace728746e2506bc1d740d8e78fceef748";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansmyanmar/NotoSansMyanmar-Bold.ttf?raw=true";
      name = "NotoSansMyanmar-Bold.ttf";
      sha256 = "e37e2ef189431020b1eaf4fb8d43252666dc24265d628145fff119613afea174";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansmyanmar/NotoSansMyanmar-ExtraBold.ttf?raw=true";
      name = "NotoSansMyanmar-ExtraBold.ttf";
      sha256 = "4b40d77d97779846ff592ab301c86427997dd46a7e49eec627b97bbd5bad5434";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansmyanmar/NotoSansMyanmar-Black.ttf?raw=true";
      name = "NotoSansMyanmar-Black.ttf";
      sha256 = "f0de61603d306840e7e06ab7c4f83b7c38f2b32ccf2571e9e61e65ef65a1d01e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansMyanmar-Thin.ttf $out/share/fonts/truetype/NotoSansMyanmar-Thin.ttf
     install -Dm644 NotoSansMyanmar-ExtraLight.ttf $out/share/fonts/truetype/NotoSansMyanmar-ExtraLight.ttf
     install -Dm644 NotoSansMyanmar-Light.ttf $out/share/fonts/truetype/NotoSansMyanmar-Light.ttf
     install -Dm644 NotoSansMyanmar-Regular.ttf $out/share/fonts/truetype/NotoSansMyanmar-Regular.ttf
     install -Dm644 NotoSansMyanmar-Medium.ttf $out/share/fonts/truetype/NotoSansMyanmar-Medium.ttf
     install -Dm644 NotoSansMyanmar-SemiBold.ttf $out/share/fonts/truetype/NotoSansMyanmar-SemiBold.ttf
     install -Dm644 NotoSansMyanmar-Bold.ttf $out/share/fonts/truetype/NotoSansMyanmar-Bold.ttf
     install -Dm644 NotoSansMyanmar-ExtraBold.ttf $out/share/fonts/truetype/NotoSansMyanmar-ExtraBold.ttf
     install -Dm644 NotoSansMyanmar-Black.ttf $out/share/fonts/truetype/NotoSansMyanmar-Black.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Myanmar";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
