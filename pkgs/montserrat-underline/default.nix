{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "montserrat-underline-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/montserratunderline/MontserratUnderline%5Bwght%5D.ttf?raw=true";
      name = "MontserratUnderline_wght_.ttf";
      sha256 = "b77c3c339f0a793692f32d53b0cf631a426f6deec94e53e013cb612f87370fcc";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/montserratunderline/MontserratUnderline-Italic%5Bwght%5D.ttf?raw=true";
      name = "MontserratUnderline-Italic_wght_.ttf";
      sha256 = "774bbfa2403188cbec3884c8a349f2700d6d2cd1fe81d91751d71bf252026a87";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 MontserratUnderline_wght_.ttf $out/share/fonts/truetype/MontserratUnderline_wght_.ttf
     install -Dm644 MontserratUnderline-Italic_wght_.ttf $out/share/fonts/truetype/MontserratUnderline-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Montserrat Underline";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
