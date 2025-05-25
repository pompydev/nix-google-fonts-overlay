{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "hanuman-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/hanuman/Hanuman%5Bwght%5D.ttf?raw=true";
      name = "Hanuman_wght_.ttf";
      sha256 = "0cb2c9dd733d7357d5b673f55d756ff9ef50dd68af9dc217c0d5a71719665536";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Hanuman_wght_.ttf $out/share/fonts/truetype/Hanuman_wght_.ttf
  '';

  meta = with lib; {
    description = "Hanuman";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
