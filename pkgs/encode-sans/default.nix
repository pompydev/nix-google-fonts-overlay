{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "encode-sans-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ec8be826b983fca7e6448c1d63d51ccae044adb4/ofl/encodesans/EncodeSans%5Bwdth,wght%5D.ttf?raw=true";
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
     install -Dm644 EncodeSans_wdth,wght_.ttf $out/share/fonts/truetype/EncodeSans_wdth,wght_.ttf
  '';

  meta = with lib; {
    description = "Encode Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
