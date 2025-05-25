{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "chiron-sung-hk-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/chironsunghk/ChironSungHK%5Bwght%5D.ttf?raw=true";
      name = "ChironSungHK_wght_.ttf";
      sha256 = "c88d5db947f4aad3399105d2c1c808a64580ab65e8cb26e58bb81cd96843d130";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/chironsunghk/ChironSungHK-Italic%5Bwght%5D.ttf?raw=true";
      name = "ChironSungHK-Italic_wght_.ttf";
      sha256 = "5e2434ba30eee3ed90fcf5aed4690964cdf9c7c0cf9bec61b1adb695f009e12f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ChironSungHK_wght_.ttf $out/share/fonts/truetype/ChironSungHK_wght_.ttf
     install -Dm644 ChironSungHK-Italic_wght_.ttf $out/share/fonts/truetype/ChironSungHK-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Chiron Sung HK";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
