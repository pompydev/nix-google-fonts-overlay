{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "manuale-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/manuale/Manuale%5Bwght%5D.ttf?raw=true";
      name = "Manuale_wght_.ttf";
      sha256 = "19ea09ad2fbf321cf8f94ac3f66547bc9b2bdf3723a2f073615eaa02fe17ded6";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/manuale/Manuale-Italic%5Bwght%5D.ttf?raw=true";
      name = "Manuale-Italic_wght_.ttf";
      sha256 = "13eb20f22e8b6a28eba93670219cb472980e8fd006319a917316434e2ed1961a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Manuale_wght_.ttf $out/share/fonts/truetype/Manuale_wght_.ttf
     install -Dm644 Manuale-Italic_wght_.ttf $out/share/fonts/truetype/Manuale-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Manuale";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
