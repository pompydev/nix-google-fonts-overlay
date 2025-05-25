{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "balsamiq-sans-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/balsamiqsans/BalsamiqSans-Regular.ttf?raw=true";
      name = "BalsamiqSans-Regular.ttf";
      sha256 = "fcc9c00a9ad6e78673fa84653745569097241d99b5d1387a23f395858ed46b7e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/balsamiqsans/BalsamiqSans-Italic.ttf?raw=true";
      name = "BalsamiqSans-Italic.ttf";
      sha256 = "0a287472035409f556acd66c1c926047ee9829a62f88b0fa273591332a8606df";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/balsamiqsans/BalsamiqSans-Bold.ttf?raw=true";
      name = "BalsamiqSans-Bold.ttf";
      sha256 = "a3302bd8424e6a37704eb5e20d5c5a3a2fd80feaf57e48a19d261f8e0c583621";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/balsamiqsans/BalsamiqSans-BoldItalic.ttf?raw=true";
      name = "BalsamiqSans-BoldItalic.ttf";
      sha256 = "4999588a66defbf39e718b3edb0b965b932157bd8d1321130de06bec0cdccc75";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BalsamiqSans-Regular.ttf $out/share/fonts/truetype/BalsamiqSans-Regular.ttf
     install -Dm644 BalsamiqSans-Italic.ttf $out/share/fonts/truetype/BalsamiqSans-Italic.ttf
     install -Dm644 BalsamiqSans-Bold.ttf $out/share/fonts/truetype/BalsamiqSans-Bold.ttf
     install -Dm644 BalsamiqSans-BoldItalic.ttf $out/share/fonts/truetype/BalsamiqSans-BoldItalic.ttf
  '';

  meta = with lib; {
    description = "Balsamiq Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
