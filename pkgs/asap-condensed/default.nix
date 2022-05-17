{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "asap-condensed-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/72e6bf867ab4b305ea3ea7a29a881752cd6222df/ofl/asapcondensed/AsapCondensed-Regular.ttf?raw=true";
      name = "AsapCondensed-Regular.ttf";
      sha256 = "95892d5a4a57839b90950cea36f41e4422cbc0550adf7ea861e903787e600b56";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/72e6bf867ab4b305ea3ea7a29a881752cd6222df/ofl/asapcondensed/AsapCondensed-Italic.ttf?raw=true";
      name = "AsapCondensed-Italic.ttf";
      sha256 = "bbc976a84bb0f51e21e186bf661512e4b0ece975807a1a9ea1a0e4099a509d02";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/72e6bf867ab4b305ea3ea7a29a881752cd6222df/ofl/asapcondensed/AsapCondensed-Medium.ttf?raw=true";
      name = "AsapCondensed-Medium.ttf";
      sha256 = "532c44963dcb901fcb05546c019121029fc78d39a07bb5dbff12bed0a95741db";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/72e6bf867ab4b305ea3ea7a29a881752cd6222df/ofl/asapcondensed/AsapCondensed-MediumItalic.ttf?raw=true";
      name = "AsapCondensed-MediumItalic.ttf";
      sha256 = "deb5396cb8c0759eb3946d67e1d6b2926b25d3906e5094b979ed44f1ac8f1164";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/72e6bf867ab4b305ea3ea7a29a881752cd6222df/ofl/asapcondensed/AsapCondensed-SemiBold.ttf?raw=true";
      name = "AsapCondensed-SemiBold.ttf";
      sha256 = "53863a4475b75d9b8ee2e488be5ec2fbc532d3cce353cfe3b3d7d352ca4d306c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/72e6bf867ab4b305ea3ea7a29a881752cd6222df/ofl/asapcondensed/AsapCondensed-SemiBoldItalic.ttf?raw=true";
      name = "AsapCondensed-SemiBoldItalic.ttf";
      sha256 = "9310ce31e50a600f09203b932459c074c883d304d2935b4e35de138fddef2ad3";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/72e6bf867ab4b305ea3ea7a29a881752cd6222df/ofl/asapcondensed/AsapCondensed-Bold.ttf?raw=true";
      name = "AsapCondensed-Bold.ttf";
      sha256 = "52b9b33337e3c2e8675b5aba8ac9bce44476275b0ffb4da0d026b3e1bc991cfa";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/72e6bf867ab4b305ea3ea7a29a881752cd6222df/ofl/asapcondensed/AsapCondensed-BoldItalic.ttf?raw=true";
      name = "AsapCondensed-BoldItalic.ttf";
      sha256 = "730e23ad2c1b3134dc2c58f3c578e061989c813230ff0fb9c91b4760035e9074";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AsapCondensed-Regular.ttf $out/share/fonts/truetype/AsapCondensed-Regular.ttf
     install -Dm644 AsapCondensed-Italic.ttf $out/share/fonts/truetype/AsapCondensed-Italic.ttf
     install -Dm644 AsapCondensed-Medium.ttf $out/share/fonts/truetype/AsapCondensed-Medium.ttf
     install -Dm644 AsapCondensed-MediumItalic.ttf $out/share/fonts/truetype/AsapCondensed-MediumItalic.ttf
     install -Dm644 AsapCondensed-SemiBold.ttf $out/share/fonts/truetype/AsapCondensed-SemiBold.ttf
     install -Dm644 AsapCondensed-SemiBoldItalic.ttf $out/share/fonts/truetype/AsapCondensed-SemiBoldItalic.ttf
     install -Dm644 AsapCondensed-Bold.ttf $out/share/fonts/truetype/AsapCondensed-Bold.ttf
     install -Dm644 AsapCondensed-BoldItalic.ttf $out/share/fonts/truetype/AsapCondensed-BoldItalic.ttf
  '';

  meta = with lib; {
    description = "Asap Condensed";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
