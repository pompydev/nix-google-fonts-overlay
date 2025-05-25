{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "victor-mono-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/victormono/VictorMono%5Bwght%5D.ttf?raw=true";
      name = "VictorMono_wght_.ttf";
      sha256 = "6fab3abe37b456f56d180987e04a3a0c326bace2cb825bc638b6be1eb03edf8f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/victormono/VictorMono-Italic%5Bwght%5D.ttf?raw=true";
      name = "VictorMono-Italic_wght_.ttf";
      sha256 = "e393afee873d56e052c10bdfcbf67053c429895bd73a4f8e59100a09ffb9d8ec";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 VictorMono_wght_.ttf $out/share/fonts/truetype/VictorMono_wght_.ttf
     install -Dm644 VictorMono-Italic_wght_.ttf $out/share/fonts/truetype/VictorMono-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Victor Mono";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
