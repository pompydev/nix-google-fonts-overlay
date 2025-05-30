{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-nag-mundari-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosansnagmundari/NotoSansNagMundari%5Bwght%5D.ttf?raw=true";
      name = "NotoSansNagMundari_wght_.ttf";
      sha256 = "326db3178a5cb37f602c2b4ee32fdcb8b97e9526954f5c715b3c11545ec8a424";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansNagMundari_wght_.ttf $out/share/fonts/truetype/NotoSansNagMundari_wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Nag Mundari";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
