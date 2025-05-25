{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "poltawski-nowy-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/poltawskinowy/PoltawskiNowy%5Bwght%5D.ttf?raw=true";
      name = "PoltawskiNowy_wght_.ttf";
      sha256 = "7fd9a33287fa563c2c6d2c2ffb8d9750b453f301c07c9f5077dbf3567aaf024e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/poltawskinowy/PoltawskiNowy-Italic%5Bwght%5D.ttf?raw=true";
      name = "PoltawskiNowy-Italic_wght_.ttf";
      sha256 = "4524bbb5fe26f853a90994994a0dca8af13da334899389800a5fc80f3482ed4a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PoltawskiNowy_wght_.ttf $out/share/fonts/truetype/PoltawskiNowy_wght_.ttf
     install -Dm644 PoltawskiNowy-Italic_wght_.ttf $out/share/fonts/truetype/PoltawskiNowy-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Poltawski Nowy";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
