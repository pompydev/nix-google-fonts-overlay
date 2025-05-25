{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-rashi-hebrew-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notorashihebrew/NotoRashiHebrew%5Bwght%5D.ttf?raw=true";
      name = "NotoRashiHebrew_wght_.ttf";
      sha256 = "4da0058f46aa66f9a334967a640a1e56abb642eba3c1c3fc5080f6282c9eb126";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoRashiHebrew_wght_.ttf $out/share/fonts/truetype/NotoRashiHebrew_wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Rashi Hebrew";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
