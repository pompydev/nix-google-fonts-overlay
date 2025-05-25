{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "pixelify-sans-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/pixelifysans/PixelifySans%5Bwght%5D.ttf?raw=true";
      name = "PixelifySans_wght_.ttf";
      sha256 = "9ba86cd010a4de309d263ceff8e8044092c9db7efda869620cb9ff1c4389e8a5";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PixelifySans_wght_.ttf $out/share/fonts/truetype/PixelifySans_wght_.ttf
  '';

  meta = with lib; {
    description = "Pixelify Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
