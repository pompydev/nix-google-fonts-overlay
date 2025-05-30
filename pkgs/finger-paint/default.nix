{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "finger-paint-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/fingerpaint/FingerPaint-Regular.ttf?raw=true";
      name = "FingerPaint-Regular.ttf";
      sha256 = "fce000ae028b09ca53949172a838282c678796e1542d259e6da373e257377fc8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 FingerPaint-Regular.ttf $out/share/fonts/truetype/FingerPaint-Regular.ttf
  '';

  meta = with lib; {
    description = "Finger Paint";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
