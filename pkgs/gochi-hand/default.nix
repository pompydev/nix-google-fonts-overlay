{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "gochi-hand-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/gochihand/GochiHand-Regular.ttf?raw=true";
      name = "GochiHand-Regular.ttf";
      sha256 = "c46b029ab4846b2935e301af0b2cf85a1d74d2858e6a33636a3e64cf3cc4696b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 GochiHand-Regular.ttf $out/share/fonts/truetype/GochiHand-Regular.ttf
  '';

  meta = with lib; {
    description = "Gochi Hand";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
