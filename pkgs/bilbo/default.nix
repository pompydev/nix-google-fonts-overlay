{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bilbo-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/bilbo/Bilbo-Regular.ttf?raw=true";
      name = "Bilbo-Regular.ttf";
      sha256 = "f479505c839db0c7a8be7108d046acca3d409a034b777514241cc6a2f9d818fc";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Bilbo-Regular.ttf $out/share/fonts/truetype/Bilbo-Regular.ttf
  '';

  meta = with lib; {
    description = "Bilbo";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
