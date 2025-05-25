{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "voces-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/voces/Voces-Regular.ttf?raw=true";
      name = "Voces-Regular.ttf";
      sha256 = "828b9e89bf8f207aa3b4bb929b2d4f19ef56e927adb55e5a22192564e891a2c8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Voces-Regular.ttf $out/share/fonts/truetype/Voces-Regular.ttf
  '';

  meta = with lib; {
    description = "Voces";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
