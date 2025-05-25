{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "cactus-classical-serif-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/cactusclassicalserif/CactusClassicalSerif-Regular.ttf?raw=true";
      name = "CactusClassicalSerif-Regular.ttf";
      sha256 = "f33676ff5957578093f3b080794683f8cc72e0dd57e52700c29e7bf60b5ca268";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 CactusClassicalSerif-Regular.ttf $out/share/fonts/truetype/CactusClassicalSerif-Regular.ttf
  '';

  meta = with lib; {
    description = "Cactus Classical Serif";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
