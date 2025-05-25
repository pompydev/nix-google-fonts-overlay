{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "holtwood-one-sc-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/holtwoodonesc/HoltwoodOneSC-Regular.ttf?raw=true";
      name = "HoltwoodOneSC-Regular.ttf";
      sha256 = "17c8ed01cc4557554749f9435798a7d18afbc97fd0c866405edd38a40470d96c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 HoltwoodOneSC-Regular.ttf $out/share/fonts/truetype/HoltwoodOneSC-Regular.ttf
  '';

  meta = with lib; {
    description = "Holtwood One SC";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
