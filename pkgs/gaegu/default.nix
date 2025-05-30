{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "gaegu-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/gaegu/Gaegu-Light.ttf?raw=true";
      name = "Gaegu-Light.ttf";
      sha256 = "da44ad6e5823819599ec42e1a516f23002cc0e72f968f93bd49e793360cd77ca";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/gaegu/Gaegu-Regular.ttf?raw=true";
      name = "Gaegu-Regular.ttf";
      sha256 = "aa52c98336f7c62e2896fc8b12b56a75d5b476d88a2f104b0980f4f7ce0adfc3";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/gaegu/Gaegu-Bold.ttf?raw=true";
      name = "Gaegu-Bold.ttf";
      sha256 = "cc38a4af9506a45254d1ce07c589ec473d9e5f0be319e5a77b17c214903f8c1c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Gaegu-Light.ttf $out/share/fonts/truetype/Gaegu-Light.ttf
     install -Dm644 Gaegu-Regular.ttf $out/share/fonts/truetype/Gaegu-Regular.ttf
     install -Dm644 Gaegu-Bold.ttf $out/share/fonts/truetype/Gaegu-Bold.ttf
  '';

  meta = with lib; {
    description = "Gaegu";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
