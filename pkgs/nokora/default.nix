{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "nokora-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7448fa7f8a8ad7ed870791be00c0a9ce542c6c5f/ofl/nokora/Nokora-Thin.ttf?raw=true";
      name = "Nokora-Thin.ttf";
      sha256 = "50c433e808e374a9ec158269eeb6f2766a239fce976c2e9ddec86774ba3c585d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7448fa7f8a8ad7ed870791be00c0a9ce542c6c5f/ofl/nokora/Nokora-Light.ttf?raw=true";
      name = "Nokora-Light.ttf";
      sha256 = "b3cb9f36507f98667a53efee25de1eaf2c6952f3f323d9ec93cad5a0b04756f5";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7448fa7f8a8ad7ed870791be00c0a9ce542c6c5f/ofl/nokora/Nokora-Regular.ttf?raw=true";
      name = "Nokora-Regular.ttf";
      sha256 = "5ead9976efd7fb4d311436efa56e520eade23bdcc60392d8bfcd049cbc974da3";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7448fa7f8a8ad7ed870791be00c0a9ce542c6c5f/ofl/nokora/Nokora-Bold.ttf?raw=true";
      name = "Nokora-Bold.ttf";
      sha256 = "2517fe13b7f3ecfc6fccb9eb4f1df28b0f02b5051f3f702fa5a7e3287661f705";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7448fa7f8a8ad7ed870791be00c0a9ce542c6c5f/ofl/nokora/Nokora-Black.ttf?raw=true";
      name = "Nokora-Black.ttf";
      sha256 = "7041f5a65241aac87af4d5b5ae34eb1df32650526c95a365ba62daffeff91c11";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Nokora-Thin.ttf $out/share/fonts/truetype/Nokora-Thin.ttf
     install -Dm644 Nokora-Light.ttf $out/share/fonts/truetype/Nokora-Light.ttf
     install -Dm644 Nokora-Regular.ttf $out/share/fonts/truetype/Nokora-Regular.ttf
     install -Dm644 Nokora-Bold.ttf $out/share/fonts/truetype/Nokora-Bold.ttf
     install -Dm644 Nokora-Black.ttf $out/share/fonts/truetype/Nokora-Black.ttf
  '';

  meta = with lib; {
    description = "Nokora";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
