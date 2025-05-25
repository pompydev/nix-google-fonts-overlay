{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "moderustic-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/moderustic/Moderustic%5Bwght%5D.ttf?raw=true";
      name = "Moderustic_wght_.ttf";
      sha256 = "ba465ae65b26bbc2eede93f05d983912999c0916ef1160449da773fa3beb7467";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Moderustic_wght_.ttf $out/share/fonts/truetype/Moderustic_wght_.ttf
  '';

  meta = with lib; {
    description = "Moderustic";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
