{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "raleway-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/raleway/Raleway%5Bwght%5D.ttf?raw=true";
      name = "Raleway_wght_.ttf";
      sha256 = "8bbcc3eb8275c388f4bcd998832f8a4b943eadbaf6a595205312774b5951aefb";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/raleway/Raleway-Italic%5Bwght%5D.ttf?raw=true";
      name = "Raleway-Italic_wght_.ttf";
      sha256 = "96629caf2202183fab46c70237055a7d67e6a5400b85413d45a77ed6f2a0770c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Raleway_wght_.ttf $out/share/fonts/truetype/Raleway_wght_.ttf
     install -Dm644 Raleway-Italic_wght_.ttf $out/share/fonts/truetype/Raleway-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Raleway";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
