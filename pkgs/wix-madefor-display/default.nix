{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "wix-madefor-display-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/wixmadefordisplay/WixMadeforDisplay%5Bwght%5D.ttf?raw=true";
      name = "WixMadeforDisplay_wght_.ttf";
      sha256 = "5cab84cd1f7231a866e59ee34245c9ca95cf23984d6b7d79132b3ffac2ef821f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 WixMadeforDisplay_wght_.ttf $out/share/fonts/truetype/WixMadeforDisplay_wght_.ttf
  '';

  meta = with lib; {
    description = "Wix Madefor Display";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
