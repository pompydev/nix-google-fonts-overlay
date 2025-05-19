{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "roboto-mono-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/robotomono/RobotoMono%5Bwght%5D.ttf?raw=true";
      name = "RobotoMono_wght_.ttf";
      sha256 = "66a80e79d17e4c7cabd162e2916578a4cc08fd19eef6e2a643305eae9c567b2b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/robotomono/RobotoMono-Italic%5Bwght%5D.ttf?raw=true";
      name = "RobotoMono-Italic_wght_.ttf";
      sha256 = "49ac343bb7b070071e53f0a8a501d68d140ed98ebd0a43b6b8fb96cf22f09ff7";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 RobotoMono_wght_.ttf $out/share/fonts/truetype/RobotoMono_wght_.ttf
     install -Dm644 RobotoMono-Italic_wght_.ttf $out/share/fonts/truetype/RobotoMono-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Roboto Mono";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
