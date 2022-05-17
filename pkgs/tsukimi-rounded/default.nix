{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "tsukimi-rounded-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b2fa8de6c4eec0f2239c7e54488c58fae3683dd3/ofl/tsukimirounded/TsukimiRounded-Light.ttf?raw=true";
      name = "TsukimiRounded-Light.ttf";
      sha256 = "6ba9e7893d81b29feb106b85c561c387d80d2c67a0347ffbc3c7a764719e42ab";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b2fa8de6c4eec0f2239c7e54488c58fae3683dd3/ofl/tsukimirounded/TsukimiRounded-Regular.ttf?raw=true";
      name = "TsukimiRounded-Regular.ttf";
      sha256 = "15f8a35fba85cda8513f99b3cb334fcaa4762833c7dae65500bed281bb8d9c74";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b2fa8de6c4eec0f2239c7e54488c58fae3683dd3/ofl/tsukimirounded/TsukimiRounded-Medium.ttf?raw=true";
      name = "TsukimiRounded-Medium.ttf";
      sha256 = "4e7ca0c575bc8efd1bd027ed7b07666d7d59da2a98611b129d647da75eca3dd2";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b2fa8de6c4eec0f2239c7e54488c58fae3683dd3/ofl/tsukimirounded/TsukimiRounded-SemiBold.ttf?raw=true";
      name = "TsukimiRounded-SemiBold.ttf";
      sha256 = "e0a3c0c7d618938def53931b1482e7a2f93fcb31ad1421b2f797e2f1ffdad543";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b2fa8de6c4eec0f2239c7e54488c58fae3683dd3/ofl/tsukimirounded/TsukimiRounded-Bold.ttf?raw=true";
      name = "TsukimiRounded-Bold.ttf";
      sha256 = "377e031bc1990911d0553619e8761b71014ed9074f322dcdb907d03c26a3b8b5";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 TsukimiRounded-Light.ttf $out/share/fonts/truetype/TsukimiRounded-Light.ttf
     install -Dm644 TsukimiRounded-Regular.ttf $out/share/fonts/truetype/TsukimiRounded-Regular.ttf
     install -Dm644 TsukimiRounded-Medium.ttf $out/share/fonts/truetype/TsukimiRounded-Medium.ttf
     install -Dm644 TsukimiRounded-SemiBold.ttf $out/share/fonts/truetype/TsukimiRounded-SemiBold.ttf
     install -Dm644 TsukimiRounded-Bold.ttf $out/share/fonts/truetype/TsukimiRounded-Bold.ttf
  '';

  meta = with lib; {
    description = "Tsukimi Rounded";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
