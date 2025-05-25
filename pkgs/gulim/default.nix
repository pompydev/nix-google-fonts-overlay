{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "gulim-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/gulim/Gulim-Regular.ttf?raw=true";
      name = "Gulim-Regular.ttf";
      sha256 = "a435857b8ffe2102f8faa7cf098d0d48b1d01d951c1c8326770848203bb7b5c2";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Gulim-Regular.ttf $out/share/fonts/truetype/Gulim-Regular.ttf
  '';

  meta = with lib; {
    description = "Gulim";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
