{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-jp-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/beff1d8226e598dfaf06f9f8312c01021f70e9d2/ofl/notoserifjp/NotoSerifJP-ExtraLight.otf?raw=true";
      name = "NotoSerifJP-ExtraLight.otf";
      sha256 = "07c7a9e09c648fe0d7eb56561abd5c6127b427ce0fec2a3f30fcf17ea98a10ee";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/beff1d8226e598dfaf06f9f8312c01021f70e9d2/ofl/notoserifjp/NotoSerifJP-Light.otf?raw=true";
      name = "NotoSerifJP-Light.otf";
      sha256 = "230c9cf1e5e74273c174640333cb352323f3d6114e3e41a3c972d1ae065e885e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/beff1d8226e598dfaf06f9f8312c01021f70e9d2/ofl/notoserifjp/NotoSerifJP-Regular.otf?raw=true";
      name = "NotoSerifJP-Regular.otf";
      sha256 = "a12875dcde3979f7901cd52c6f750f763e5ad2824cf3c27019a61dd5de5a8d9d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/beff1d8226e598dfaf06f9f8312c01021f70e9d2/ofl/notoserifjp/NotoSerifJP-Medium.otf?raw=true";
      name = "NotoSerifJP-Medium.otf";
      sha256 = "ead14d3d2b05d4f22360940fd3a14a28da9e0a67ac7df261ab17121807ad7db1";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/beff1d8226e598dfaf06f9f8312c01021f70e9d2/ofl/notoserifjp/NotoSerifJP-SemiBold.otf?raw=true";
      name = "NotoSerifJP-SemiBold.otf";
      sha256 = "4d8a38b1c13717513aa93d5efb22c801b5b6494ecd7135bc3ebabce45e703fd0";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/beff1d8226e598dfaf06f9f8312c01021f70e9d2/ofl/notoserifjp/NotoSerifJP-Bold.otf?raw=true";
      name = "NotoSerifJP-Bold.otf";
      sha256 = "36fb67448496053160fb393a5839742bcb88dfad1810c9081d16275061422483";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/beff1d8226e598dfaf06f9f8312c01021f70e9d2/ofl/notoserifjp/NotoSerifJP-Black.otf?raw=true";
      name = "NotoSerifJP-Black.otf";
      sha256 = "82493ab8e52bbbdc196ea619e3a4175397b66c1f3e546a37f572b142c44c9a40";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSerifJP-ExtraLight.otf $out/share/fonts/opentype/NotoSerifJP-ExtraLight.otf
     install -Dm644 NotoSerifJP-Light.otf $out/share/fonts/opentype/NotoSerifJP-Light.otf
     install -Dm644 NotoSerifJP-Regular.otf $out/share/fonts/opentype/NotoSerifJP-Regular.otf
     install -Dm644 NotoSerifJP-Medium.otf $out/share/fonts/opentype/NotoSerifJP-Medium.otf
     install -Dm644 NotoSerifJP-SemiBold.otf $out/share/fonts/opentype/NotoSerifJP-SemiBold.otf
     install -Dm644 NotoSerifJP-Bold.otf $out/share/fonts/opentype/NotoSerifJP-Bold.otf
     install -Dm644 NotoSerifJP-Black.otf $out/share/fonts/opentype/NotoSerifJP-Black.otf
  '';

  meta = with lib; {
    description = "Noto Serif JP";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
