{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "encode-sans-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/encodesans/EncodeSans%5Bwdth,wght%5D.ttf?raw=true";
      name = "EncodeSans_wdth,wght_.ttf";
      sha256 = "7735320abb63a1022d086c938872dae32754db733ecd4dcd402f2a445cbeb43f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 EncodeSans_wdth-wght_.ttf $out/share/fonts/truetype/EncodeSans_wdth-wght_.ttf
  '';

  meta = with lib; {
    description = "Encode Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
