{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "sofia-sans-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/sofiasans/SofiaSans%5Bwght%5D.ttf?raw=true";
      name = "SofiaSans_wght_.ttf";
      sha256 = "a3e1019b8867e21b75d26a7b59d4eb2c81d1acf6b69b9ae6cedca269fb68e291";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/sofiasans/SofiaSans-Italic%5Bwght%5D.ttf?raw=true";
      name = "SofiaSans-Italic_wght_.ttf";
      sha256 = "c0e69116d34100212881b5f993225ff0c3ea23e2c147f4c0853389923c9ab6a5";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SofiaSans_wght_.ttf $out/share/fonts/truetype/SofiaSans_wght_.ttf
     install -Dm644 SofiaSans-Italic_wght_.ttf $out/share/fonts/truetype/SofiaSans-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Sofia Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
