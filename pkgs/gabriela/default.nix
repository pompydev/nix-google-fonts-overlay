{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "gabriela-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/gabriela/Gabriela-Regular.ttf?raw=true";
      name = "Gabriela-Regular.ttf";
      sha256 = "c38334bfff10cc97fa6e5c5ddf1f12dd54428bb218d7a423fb3c07bf8180bfd8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Gabriela-Regular.ttf $out/share/fonts/truetype/Gabriela-Regular.ttf
  '';

  meta = with lib; {
    description = "Gabriela";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
