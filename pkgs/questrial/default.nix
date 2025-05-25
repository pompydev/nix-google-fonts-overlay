{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "questrial-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/questrial/Questrial-Regular.ttf?raw=true";
      name = "Questrial-Regular.ttf";
      sha256 = "0ee7f2debabb13773fd38468b31820e11fca202a8f98c4d80b6ffcb796899b6f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Questrial-Regular.ttf $out/share/fonts/truetype/Questrial-Regular.ttf
  '';

  meta = with lib; {
    description = "Questrial";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
