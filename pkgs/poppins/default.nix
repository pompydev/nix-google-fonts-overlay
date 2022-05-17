{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "poppins-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7dc16b7de42db624b902f2292b68ed9e489e5053/ofl/poppins/Poppins-Thin.ttf?raw=true";
      name = "Poppins-Thin.ttf";
      sha256 = "6d8e5d9d29140cc93e321745fa1243c67889e6bc3639ec34db64f3da7a496352";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7dc16b7de42db624b902f2292b68ed9e489e5053/ofl/poppins/Poppins-ThinItalic.ttf?raw=true";
      name = "Poppins-ThinItalic.ttf";
      sha256 = "46df80ac970f5e84829b868d283878b4d97e289c7b1245541d8bbf66b5d670a8";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7dc16b7de42db624b902f2292b68ed9e489e5053/ofl/poppins/Poppins-ExtraLight.ttf?raw=true";
      name = "Poppins-ExtraLight.ttf";
      sha256 = "55c03314cc754e26f741f97890e5e9cbe3b3278fe3abcecfecafd60111b2643d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7dc16b7de42db624b902f2292b68ed9e489e5053/ofl/poppins/Poppins-ExtraLightItalic.ttf?raw=true";
      name = "Poppins-ExtraLightItalic.ttf";
      sha256 = "7171a17e4cda8f6ded78a7a931f9b7f38987057f3ffd1fe07a71528ad0f01e49";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7dc16b7de42db624b902f2292b68ed9e489e5053/ofl/poppins/Poppins-Light.ttf?raw=true";
      name = "Poppins-Light.ttf";
      sha256 = "650ba57fa99d12ec40c31ccfb680be656be4497fbe14164617d67e32ffe9cd46";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7dc16b7de42db624b902f2292b68ed9e489e5053/ofl/poppins/Poppins-LightItalic.ttf?raw=true";
      name = "Poppins-LightItalic.ttf";
      sha256 = "b8f9c5be59723fadf8e5447fa1245c2c53b60a3464a24d6ece9ee3c283d8917b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7dc16b7de42db624b902f2292b68ed9e489e5053/ofl/poppins/Poppins-Regular.ttf?raw=true";
      name = "Poppins-Regular.ttf";
      sha256 = "7e65201e9b79159e2300267cc885e16c8dcef2424cdfa09a29bfb0980a94a7ba";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7dc16b7de42db624b902f2292b68ed9e489e5053/ofl/poppins/Poppins-Italic.ttf?raw=true";
      name = "Poppins-Italic.ttf";
      sha256 = "4fa76ae75b40f926420514044722cb97f32186cafd3b38263cc34dad7174d46d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7dc16b7de42db624b902f2292b68ed9e489e5053/ofl/poppins/Poppins-Medium.ttf?raw=true";
      name = "Poppins-Medium.ttf";
      sha256 = "90373e7d838d32468438fc3e152dca0bdb12edcab99ea639f158790b1ba1fd05";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7dc16b7de42db624b902f2292b68ed9e489e5053/ofl/poppins/Poppins-MediumItalic.ttf?raw=true";
      name = "Poppins-MediumItalic.ttf";
      sha256 = "765addf6c7c11ec3c54325cacd68cabd05df8e4b6455302d812a9b9bafd1c614";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7dc16b7de42db624b902f2292b68ed9e489e5053/ofl/poppins/Poppins-SemiBold.ttf?raw=true";
      name = "Poppins-SemiBold.ttf";
      sha256 = "d3bf1bdaf0550e83da9ac0b1d1d9fe6db086835a83aa28578e609a394b9a0286";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7dc16b7de42db624b902f2292b68ed9e489e5053/ofl/poppins/Poppins-SemiBoldItalic.ttf?raw=true";
      name = "Poppins-SemiBoldItalic.ttf";
      sha256 = "16bb118aa232c9a13fa238027d24d7854dd1a1d9cbaf99b17fec4388d56b432c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7dc16b7de42db624b902f2292b68ed9e489e5053/ofl/poppins/Poppins-Bold.ttf?raw=true";
      name = "Poppins-Bold.ttf";
      sha256 = "983676516167748b74de6f4771fb384c664fd913acb8b471122ecacf5da5ea6c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7dc16b7de42db624b902f2292b68ed9e489e5053/ofl/poppins/Poppins-BoldItalic.ttf?raw=true";
      name = "Poppins-BoldItalic.ttf";
      sha256 = "3572ac8116a0ac7317d342262b29937bcbaf94d8f03f90df6fe666fa7e2fb43a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7dc16b7de42db624b902f2292b68ed9e489e5053/ofl/poppins/Poppins-ExtraBold.ttf?raw=true";
      name = "Poppins-ExtraBold.ttf";
      sha256 = "f2ab17c1a63a0ecc12c2461848fc8a469395e3cd2d641803e889c643d9f958e1";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7dc16b7de42db624b902f2292b68ed9e489e5053/ofl/poppins/Poppins-ExtraBoldItalic.ttf?raw=true";
      name = "Poppins-ExtraBoldItalic.ttf";
      sha256 = "dc00a2eb988373e9f4e99bf8ff76c6315ee21d36b341cbbff024e4c18cc7ac03";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7dc16b7de42db624b902f2292b68ed9e489e5053/ofl/poppins/Poppins-Black.ttf?raw=true";
      name = "Poppins-Black.ttf";
      sha256 = "d82aaaf98a9283f9a8edd24e51173337d8eaf09e25cd3d98831f8ec8461748a1";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7dc16b7de42db624b902f2292b68ed9e489e5053/ofl/poppins/Poppins-BlackItalic.ttf?raw=true";
      name = "Poppins-BlackItalic.ttf";
      sha256 = "f4852ca89c29f69d800e14f097ed4d1f0a0cc454e9f77d73bfd6db1f71c287a0";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Poppins-Thin.ttf $out/share/fonts/truetype/Poppins-Thin.ttf
     install -Dm644 Poppins-ThinItalic.ttf $out/share/fonts/truetype/Poppins-ThinItalic.ttf
     install -Dm644 Poppins-ExtraLight.ttf $out/share/fonts/truetype/Poppins-ExtraLight.ttf
     install -Dm644 Poppins-ExtraLightItalic.ttf $out/share/fonts/truetype/Poppins-ExtraLightItalic.ttf
     install -Dm644 Poppins-Light.ttf $out/share/fonts/truetype/Poppins-Light.ttf
     install -Dm644 Poppins-LightItalic.ttf $out/share/fonts/truetype/Poppins-LightItalic.ttf
     install -Dm644 Poppins-Regular.ttf $out/share/fonts/truetype/Poppins-Regular.ttf
     install -Dm644 Poppins-Italic.ttf $out/share/fonts/truetype/Poppins-Italic.ttf
     install -Dm644 Poppins-Medium.ttf $out/share/fonts/truetype/Poppins-Medium.ttf
     install -Dm644 Poppins-MediumItalic.ttf $out/share/fonts/truetype/Poppins-MediumItalic.ttf
     install -Dm644 Poppins-SemiBold.ttf $out/share/fonts/truetype/Poppins-SemiBold.ttf
     install -Dm644 Poppins-SemiBoldItalic.ttf $out/share/fonts/truetype/Poppins-SemiBoldItalic.ttf
     install -Dm644 Poppins-Bold.ttf $out/share/fonts/truetype/Poppins-Bold.ttf
     install -Dm644 Poppins-BoldItalic.ttf $out/share/fonts/truetype/Poppins-BoldItalic.ttf
     install -Dm644 Poppins-ExtraBold.ttf $out/share/fonts/truetype/Poppins-ExtraBold.ttf
     install -Dm644 Poppins-ExtraBoldItalic.ttf $out/share/fonts/truetype/Poppins-ExtraBoldItalic.ttf
     install -Dm644 Poppins-Black.ttf $out/share/fonts/truetype/Poppins-Black.ttf
     install -Dm644 Poppins-BlackItalic.ttf $out/share/fonts/truetype/Poppins-BlackItalic.ttf
  '';

  meta = with lib; {
    description = "Poppins";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
