{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "stint-ultra-expanded-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/stintultraexpanded/StintUltraExpanded-Regular.ttf?raw=true";
      name = "StintUltraExpanded-Regular.ttf";
      sha256 = "82b0ec50644e8824100a32085c7136aeb79b2dc9a81804aefc82c3c9337f8a6f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 StintUltraExpanded-Regular.ttf $out/share/fonts/truetype/StintUltraExpanded-Regular.ttf
  '';

  meta = with lib; {
    description = "Stint Ultra Expanded";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
