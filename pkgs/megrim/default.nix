{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "megrim-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/megrim/Megrim.ttf?raw=true";
      name = "Megrim.ttf";
      sha256 = "88d30544a63121ab021f4cf60f57257c81caaeddeeb2eb4d6ec1a600ae779cfd";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Megrim.ttf $out/share/fonts/truetype/Megrim.ttf
  '';

  meta = with lib; {
    description = "Megrim";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
