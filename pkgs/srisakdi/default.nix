{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "srisakdi-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/srisakdi/Srisakdi-Regular.ttf?raw=true";
      name = "Srisakdi-Regular.ttf";
      sha256 = "073d1694bda5cf42082574a4b7d57df298d7f2cfc9ee997f8f5ab9b214cf72c9";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/srisakdi/Srisakdi-Bold.ttf?raw=true";
      name = "Srisakdi-Bold.ttf";
      sha256 = "c017270f68bac7c3b282c9d80e6665f56ad4f5d670db590a2851dcb9c0a75f57";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Srisakdi-Regular.ttf $out/share/fonts/truetype/Srisakdi-Regular.ttf
     install -Dm644 Srisakdi-Bold.ttf $out/share/fonts/truetype/Srisakdi-Bold.ttf
  '';

  meta = with lib; {
    description = "Srisakdi";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
