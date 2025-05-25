{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "montaga-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/montaga/Montaga-Regular.ttf?raw=true";
      name = "Montaga-Regular.ttf";
      sha256 = "2f84c4a9ee4921dd629ad55c0003e5f15448737884dea1c3ffd9aacaf3b476a0";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Montaga-Regular.ttf $out/share/fonts/truetype/Montaga-Regular.ttf
  '';

  meta = with lib; {
    description = "Montaga";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
