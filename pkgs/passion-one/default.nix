{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "passion-one-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/passionone/PassionOne-Regular.ttf?raw=true";
      name = "PassionOne-Regular.ttf";
      sha256 = "86fea5001e5d751cf5696f0ecd4754db80918adbb12658add959f5bcdc92b09b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/passionone/PassionOne-Bold.ttf?raw=true";
      name = "PassionOne-Bold.ttf";
      sha256 = "3a7249909b2e56e831f8a357a4ee549e9c5945cd003f0e5e3bd8791a76d98b7e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/passionone/PassionOne-Black.ttf?raw=true";
      name = "PassionOne-Black.ttf";
      sha256 = "c954dbac8835bf16f938f8d97fe1627d47aa122d60246169ff55cec772949e96";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PassionOne-Regular.ttf $out/share/fonts/truetype/PassionOne-Regular.ttf
     install -Dm644 PassionOne-Bold.ttf $out/share/fonts/truetype/PassionOne-Bold.ttf
     install -Dm644 PassionOne-Black.ttf $out/share/fonts/truetype/PassionOne-Black.ttf
  '';

  meta = with lib; {
    description = "Passion One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
