{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "eater-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/eater/Eater-Regular.ttf?raw=true";
      name = "Eater-Regular.ttf";
      sha256 = "df2744af0f58592c4ff13e8205e62a56f7bdf915b3e31c9def075668c42a2b3f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Eater-Regular.ttf $out/share/fonts/truetype/Eater-Regular.ttf
  '';

  meta = with lib; {
    description = "Eater";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
