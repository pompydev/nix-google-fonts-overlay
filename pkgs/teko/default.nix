{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "teko-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/teko/Teko%5Bwght%5D.ttf?raw=true";
      name = "Teko_wght_.ttf";
      sha256 = "d1321889f262bbbff632e7976349853399cd097b6f382d4b19790c915c13c1ae";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Teko_wght_.ttf $out/share/fonts/truetype/Teko_wght_.ttf
  '';

  meta = with lib; {
    description = "Teko";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
