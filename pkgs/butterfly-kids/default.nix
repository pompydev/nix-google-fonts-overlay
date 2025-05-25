{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "butterfly-kids-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/butterflykids/ButterflyKids-Regular.ttf?raw=true";
      name = "ButterflyKids-Regular.ttf";
      sha256 = "4a131f49c3d90e816e6447d244090eb2c36cdbf26be53254271ccdf2d8d111b9";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ButterflyKids-Regular.ttf $out/share/fonts/truetype/ButterflyKids-Regular.ttf
  '';

  meta = with lib; {
    description = "Butterfly Kids";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
