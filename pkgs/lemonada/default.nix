{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "lemonada-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/lemonada/Lemonada%5Bwght%5D.ttf?raw=true";
      name = "Lemonada_wght_.ttf";
      sha256 = "84134e9e1da7d593839073157980a4d38296d2be10b61469a8f3169204959ad9";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Lemonada_wght_.ttf $out/share/fonts/truetype/Lemonada_wght_.ttf
  '';

  meta = with lib; {
    description = "Lemonada";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
