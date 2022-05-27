{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "hahmlet-${version}";
  version = "2022-05-23-214203";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/afb3b9481d0a9a6be66bd779417b48ebcfd437bc/ofl/hahmlet/Hahmlet%5Bwght%5D.ttf?raw=true";
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
