{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "cormorant-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/cormorant/Cormorant%5Bwght%5D.ttf?raw=true";
      name = "Cormorant_wght_.ttf";
      sha256 = "8f12cb21f05b61649192eaff13eeeb1b5619bc524feeae672fb916974259a076";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/cormorant/Cormorant-Italic%5Bwght%5D.ttf?raw=true";
      name = "Cormorant-Italic_wght_.ttf";
      sha256 = "2c4e1c43fa126b51a84160815b9264af442c6c531d13bfd3c1723703cd489dd2";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Cormorant_wght_.ttf $out/share/fonts/truetype/Cormorant_wght_.ttf
     install -Dm644 Cormorant-Italic_wght_.ttf $out/share/fonts/truetype/Cormorant-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Cormorant";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
