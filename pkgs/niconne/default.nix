{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "niconne-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/niconne/Niconne-Regular.ttf?raw=true";
      name = "Niconne-Regular.ttf";
      sha256 = "dc70580a25914aeec39a9460b7858ee08eb4ad0bbbcd1d7c9cb888a6ea989a27";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Niconne-Regular.ttf $out/share/fonts/truetype/Niconne-Regular.ttf
  '';

  meta = with lib; {
    description = "Niconne";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
