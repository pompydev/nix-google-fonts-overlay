{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "anta-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/anta/Anta-Regular.ttf?raw=true";
      name = "Anta-Regular.ttf";
      sha256 = "9f3b9723a50c1244d49906b1892b3aad43876ab9a2de80288db47821b0c7b298";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Anta-Regular.ttf $out/share/fonts/truetype/Anta-Regular.ttf
  '';

  meta = with lib; {
    description = "Anta";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
