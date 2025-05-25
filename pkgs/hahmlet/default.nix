{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "hahmlet-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/hahmlet/Hahmlet%5Bwght%5D.ttf?raw=true";
      name = "Hahmlet_wght_.ttf";
      sha256 = "892bffe530255770a7435226154a02f519055ff6bedf64254f37f21d15a59279";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Hahmlet_wght_.ttf $out/share/fonts/truetype/Hahmlet_wght_.ttf
  '';

  meta = with lib; {
    description = "Hahmlet";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
