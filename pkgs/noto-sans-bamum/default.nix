{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-bamum-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosansbamum/NotoSansBamum%5Bwght%5D.ttf?raw=true";
      name = "NotoSansBamum_wght_.ttf";
      sha256 = "ac9c498f2030192040e2c5541302ed428a81184ff4635faacd32417a58d83e53";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansBamum_wght_.ttf $out/share/fonts/truetype/NotoSansBamum_wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Bamum";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
