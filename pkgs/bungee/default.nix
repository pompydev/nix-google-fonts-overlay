{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bungee-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/bungee/Bungee-Regular.ttf?raw=true";
      name = "Bungee-Regular.ttf";
      sha256 = "c4f5361ce120af3e6b9156d0bf379fa19cda2ea0cd18ac01fd99596c6bf66e3f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Bungee-Regular.ttf $out/share/fonts/truetype/Bungee-Regular.ttf
  '';

  meta = with lib; {
    description = "Bungee";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
