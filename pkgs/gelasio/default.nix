{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "gelasio-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e23cd10a54ee518f3913ba485e9373ce4d977976/ofl/gelasio/Gelasio-Regular.ttf?raw=true";
      name = "Gelasio-Regular.ttf";
      sha256 = "a0a1c727f15f40b52ff4fee3242c59684cbfcd27ade40f7a21e5d0aaaa5d99d5";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e23cd10a54ee518f3913ba485e9373ce4d977976/ofl/gelasio/Gelasio-Italic.ttf?raw=true";
      name = "Gelasio-Italic.ttf";
      sha256 = "7318bcf4e379e0dadddbd70d2042b357015d4bf9dcf6e505c8bace1443fc1e39";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e23cd10a54ee518f3913ba485e9373ce4d977976/ofl/gelasio/Gelasio-Medium.ttf?raw=true";
      name = "Gelasio-Medium.ttf";
      sha256 = "836548cc76c61963792523f231da2deab2c6178cd56c47b31d5a5fc038fed682";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e23cd10a54ee518f3913ba485e9373ce4d977976/ofl/gelasio/Gelasio-MediumItalic.ttf?raw=true";
      name = "Gelasio-MediumItalic.ttf";
      sha256 = "bb4b84e191d4b2f99184139dfffbbd02afbd3c95efa4d8a1021a387bcfc6a529";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e23cd10a54ee518f3913ba485e9373ce4d977976/ofl/gelasio/Gelasio-SemiBold.ttf?raw=true";
      name = "Gelasio-SemiBold.ttf";
      sha256 = "bf03c21e0040af7ef00d8145513fdddd14f574c42b52e29163f3bd9567769191";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e23cd10a54ee518f3913ba485e9373ce4d977976/ofl/gelasio/Gelasio-SemiBoldItalic.ttf?raw=true";
      name = "Gelasio-SemiBoldItalic.ttf";
      sha256 = "6a15a291d131dfa02e5571d4a381279db995325f49e01977bd469134f7aaed54";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e23cd10a54ee518f3913ba485e9373ce4d977976/ofl/gelasio/Gelasio-Bold.ttf?raw=true";
      name = "Gelasio-Bold.ttf";
      sha256 = "3f046687ebea8ff3d01ab8101b7fa1954a8599ab66d0dfa0b3ef76907f340455";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e23cd10a54ee518f3913ba485e9373ce4d977976/ofl/gelasio/Gelasio-BoldItalic.ttf?raw=true";
      name = "Gelasio-BoldItalic.ttf";
      sha256 = "d94a0f5c188a8d41fda829fcc2d05d0d42050d60c8076e833ad37960330ff940";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Gelasio-Regular.ttf $out/share/fonts/truetype/Gelasio-Regular.ttf
     install -Dm644 Gelasio-Italic.ttf $out/share/fonts/truetype/Gelasio-Italic.ttf
     install -Dm644 Gelasio-Medium.ttf $out/share/fonts/truetype/Gelasio-Medium.ttf
     install -Dm644 Gelasio-MediumItalic.ttf $out/share/fonts/truetype/Gelasio-MediumItalic.ttf
     install -Dm644 Gelasio-SemiBold.ttf $out/share/fonts/truetype/Gelasio-SemiBold.ttf
     install -Dm644 Gelasio-SemiBoldItalic.ttf $out/share/fonts/truetype/Gelasio-SemiBoldItalic.ttf
     install -Dm644 Gelasio-Bold.ttf $out/share/fonts/truetype/Gelasio-Bold.ttf
     install -Dm644 Gelasio-BoldItalic.ttf $out/share/fonts/truetype/Gelasio-BoldItalic.ttf
  '';

  meta = with lib; {
    description = "Gelasio";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
