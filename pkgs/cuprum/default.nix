{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "cuprum-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/cuprum/Cuprum%5Bwght%5D.ttf?raw=true";
      name = "Cuprum_wght_.ttf";
      sha256 = "be75585aa57a5f1c1d10de61305bb4266effa1b9083722d20c26adf97e911534";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/cuprum/Cuprum-Italic%5Bwght%5D.ttf?raw=true";
      name = "Cuprum-Italic_wght_.ttf";
      sha256 = "1b2fa2441b421e16176ed3b0356949f406ef44497df17b2ee7977aa7f838312a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Cuprum_wght_.ttf $out/share/fonts/truetype/Cuprum_wght_.ttf
     install -Dm644 Cuprum-Italic_wght_.ttf $out/share/fonts/truetype/Cuprum-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Cuprum";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
