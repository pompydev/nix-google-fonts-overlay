{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "markazi-text-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/markazitext/MarkaziText%5Bwght%5D.ttf?raw=true";
      name = "MarkaziText_wght_.ttf";
      sha256 = "424b7331681160ff2a4b209bfc356ea9564d429a7daea43ee4dc28de8ff4f9fe";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 MarkaziText_wght_.ttf $out/share/fonts/truetype/MarkaziText_wght_.ttf
  '';

  meta = with lib; {
    description = "Markazi Text";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
