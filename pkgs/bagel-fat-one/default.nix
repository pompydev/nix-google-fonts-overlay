{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bagel-fat-one-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/bagelfatone/BagelFatOne-Regular.ttf?raw=true";
      name = "BagelFatOne-Regular.ttf";
      sha256 = "9286944032c5a9b20ad70940105417beae14013e0b4f5fc292425afdc4330245";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BagelFatOne-Regular.ttf $out/share/fonts/truetype/BagelFatOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Bagel Fat One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
