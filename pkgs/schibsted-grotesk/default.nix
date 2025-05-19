{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "schibsted-grotesk-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/schibstedgrotesk/SchibstedGrotesk%5Bwght%5D.ttf?raw=true";
      name = "SchibstedGrotesk_wght_.ttf";
      sha256 = "6ceeadf6be8e1fd7687011c7fa38ed0edd1abe967a0b73d97caec183552e823d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/schibstedgrotesk/SchibstedGrotesk-Italic%5Bwght%5D.ttf?raw=true";
      name = "SchibstedGrotesk-Italic_wght_.ttf";
      sha256 = "b49fedb6f3a2ff9b43e13351888641505dc8e5f300941e597eecbc3f52ba357b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SchibstedGrotesk_wght_.ttf $out/share/fonts/truetype/SchibstedGrotesk_wght_.ttf
     install -Dm644 SchibstedGrotesk-Italic_wght_.ttf $out/share/fonts/truetype/SchibstedGrotesk-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Schibsted Grotesk";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
