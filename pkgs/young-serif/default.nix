{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "young-serif-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/youngserif/YoungSerif-Regular.ttf?raw=true";
      name = "YoungSerif-Regular.ttf";
      sha256 = "42bb2602364b28569fdce5eeb6ab3d81cf8090ba81b211f1229ed69f33155523";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 YoungSerif-Regular.ttf $out/share/fonts/truetype/YoungSerif-Regular.ttf
  '';

  meta = with lib; {
    description = "Young Serif";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
