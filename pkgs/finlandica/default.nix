{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "finlandica-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/finlandica/Finlandica%5Bwght%5D.ttf?raw=true";
      name = "Finlandica_wght_.ttf";
      sha256 = "8192c7f916ad929890b799bd4fe0974200be62e024c267c7b234632caca6658e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/finlandica/Finlandica-Italic%5Bwght%5D.ttf?raw=true";
      name = "Finlandica-Italic_wght_.ttf";
      sha256 = "70b7bddb5b5d01aeb8461e5a4c0d022efbc892ad96f68eb7d163cb3440360725";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Finlandica_wght_.ttf $out/share/fonts/truetype/Finlandica_wght_.ttf
     install -Dm644 Finlandica-Italic_wght_.ttf $out/share/fonts/truetype/Finlandica-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Finlandica";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
