{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "sedan-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/sedan/Sedan-Regular.ttf?raw=true";
      name = "Sedan-Regular.ttf";
      sha256 = "ad6ea5b34a1e5508bc35ac01c9aa23367c9aace7e1cd42d54bcb517ec788e0e8";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/sedan/Sedan-Italic.ttf?raw=true";
      name = "Sedan-Italic.ttf";
      sha256 = "d76f24f467075ba42c7483cde7ab8f785bd10a74e6e7eb967ab10c876bac1051";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Sedan-Regular.ttf $out/share/fonts/truetype/Sedan-Regular.ttf
     install -Dm644 Sedan-Italic.ttf $out/share/fonts/truetype/Sedan-Italic.ttf
  '';

  meta = with lib; {
    description = "Sedan";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
