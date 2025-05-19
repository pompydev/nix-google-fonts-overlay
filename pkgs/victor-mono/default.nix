{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "victor-mono-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/victormono/VictorMono%5Bwght%5D.ttf?raw=true";
      name = "VictorMono_wght_.ttf";
      sha256 = "6fab3abe37b456f56d180987e04a3a0c326bace2cb825bc638b6be1eb03edf8f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/victormono/VictorMono-Italic%5Bwght%5D.ttf?raw=true";
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
