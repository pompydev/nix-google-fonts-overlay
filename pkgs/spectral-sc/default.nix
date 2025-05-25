{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "spectral-sc-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/spectralsc/SpectralSC-ExtraLight.ttf?raw=true";
      name = "SpectralSC-ExtraLight.ttf";
      sha256 = "997326a9e206285ca211ec68aa34487853d08f1b2e5eaa51b76b603ad34e2021";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/spectralsc/SpectralSC-ExtraLightItalic.ttf?raw=true";
      name = "SpectralSC-ExtraLightItalic.ttf";
      sha256 = "d0f32620ee3604d42417f6388c13cd8f87d80563a9d35a4612bda23d19a1fff6";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/spectralsc/SpectralSC-Light.ttf?raw=true";
      name = "SpectralSC-Light.ttf";
      sha256 = "53ef48cb4905c3bbae15baa4f0d72e2cde19350f80a8a497665dfe5a68ddc080";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/spectralsc/SpectralSC-LightItalic.ttf?raw=true";
      name = "SpectralSC-LightItalic.ttf";
      sha256 = "ab0c53a48ff4671a15b2a25a53f130e02ecd828a8caa948b1b4e49f4ea28103c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/spectralsc/SpectralSC-Regular.ttf?raw=true";
      name = "SpectralSC-Regular.ttf";
      sha256 = "11b89ee8eff243c4068a9fc105650f8d90005b288f90c98c6d40fecd85a0306d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/spectralsc/SpectralSC-Italic.ttf?raw=true";
      name = "SpectralSC-Italic.ttf";
      sha256 = "774281eb396b34b89b30ffc7779d32267299f275b050be6723c7cc252177e33d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/spectralsc/SpectralSC-Medium.ttf?raw=true";
      name = "SpectralSC-Medium.ttf";
      sha256 = "68169569f117fd5aa62dc443cc99683a492922b00fdc3be6df7ccf59dadd8418";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/spectralsc/SpectralSC-MediumItalic.ttf?raw=true";
      name = "SpectralSC-MediumItalic.ttf";
      sha256 = "94ad7436eb6896f24a254c5c17ba4123a53221a27f8f5f8d4ac054bade66feb6";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/spectralsc/SpectralSC-SemiBold.ttf?raw=true";
      name = "SpectralSC-SemiBold.ttf";
      sha256 = "7b907d97835d68c84abe35c6a3294aeedf7ac271ced70292502019b667034477";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/spectralsc/SpectralSC-SemiBoldItalic.ttf?raw=true";
      name = "SpectralSC-SemiBoldItalic.ttf";
      sha256 = "d7f8d9793b2c5d76a0b2b9232b6f92051c878951e1a29a87b5608f21751f72ed";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/spectralsc/SpectralSC-Bold.ttf?raw=true";
      name = "SpectralSC-Bold.ttf";
      sha256 = "ddbd53f4b1fd856f5a9b6f5110c095a4a4f4382bdab6decfd79cffd15656dddc";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/spectralsc/SpectralSC-BoldItalic.ttf?raw=true";
      name = "SpectralSC-BoldItalic.ttf";
      sha256 = "66d58379ac57b8cf25c4c7e45290934c39098533d3490259826e1e8f2f294caa";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/spectralsc/SpectralSC-ExtraBold.ttf?raw=true";
      name = "SpectralSC-ExtraBold.ttf";
      sha256 = "63847d218d39256fa2d753339f5c45adb6369b1ec65e09c3644830adffdc5ae7";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/spectralsc/SpectralSC-ExtraBoldItalic.ttf?raw=true";
      name = "SpectralSC-ExtraBoldItalic.ttf";
      sha256 = "166350d8946a85b0678f65b684ecd0027dcbd7832f27ea93a811b6c998e9d7b0";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SpectralSC-ExtraLight.ttf $out/share/fonts/truetype/SpectralSC-ExtraLight.ttf
     install -Dm644 SpectralSC-ExtraLightItalic.ttf $out/share/fonts/truetype/SpectralSC-ExtraLightItalic.ttf
     install -Dm644 SpectralSC-Light.ttf $out/share/fonts/truetype/SpectralSC-Light.ttf
     install -Dm644 SpectralSC-LightItalic.ttf $out/share/fonts/truetype/SpectralSC-LightItalic.ttf
     install -Dm644 SpectralSC-Regular.ttf $out/share/fonts/truetype/SpectralSC-Regular.ttf
     install -Dm644 SpectralSC-Italic.ttf $out/share/fonts/truetype/SpectralSC-Italic.ttf
     install -Dm644 SpectralSC-Medium.ttf $out/share/fonts/truetype/SpectralSC-Medium.ttf
     install -Dm644 SpectralSC-MediumItalic.ttf $out/share/fonts/truetype/SpectralSC-MediumItalic.ttf
     install -Dm644 SpectralSC-SemiBold.ttf $out/share/fonts/truetype/SpectralSC-SemiBold.ttf
     install -Dm644 SpectralSC-SemiBoldItalic.ttf $out/share/fonts/truetype/SpectralSC-SemiBoldItalic.ttf
     install -Dm644 SpectralSC-Bold.ttf $out/share/fonts/truetype/SpectralSC-Bold.ttf
     install -Dm644 SpectralSC-BoldItalic.ttf $out/share/fonts/truetype/SpectralSC-BoldItalic.ttf
     install -Dm644 SpectralSC-ExtraBold.ttf $out/share/fonts/truetype/SpectralSC-ExtraBold.ttf
     install -Dm644 SpectralSC-ExtraBoldItalic.ttf $out/share/fonts/truetype/SpectralSC-ExtraBoldItalic.ttf
  '';

  meta = with lib; {
    description = "Spectral SC";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
