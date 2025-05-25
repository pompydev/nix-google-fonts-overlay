{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "exo-2-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/exo2/Exo2%5Bwght%5D.ttf?raw=true";
      name = "Exo2_wght_.ttf";
      sha256 = "205a448676a2586f9c57c25f3d5c58ca8db7e6cf5edf7506783a010c6fe2bfb5";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/exo2/Exo2-Italic%5Bwght%5D.ttf?raw=true";
      name = "Exo2-Italic_wght_.ttf";
      sha256 = "bad568cea9ed23d6ae4aea41ad3f7747752952aabdd85d7f01474af392a21b32";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Exo2_wght_.ttf $out/share/fonts/truetype/Exo2_wght_.ttf
     install -Dm644 Exo2-Italic_wght_.ttf $out/share/fonts/truetype/Exo2-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Exo 2";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
