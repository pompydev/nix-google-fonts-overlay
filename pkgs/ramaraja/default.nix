{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ramaraja-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/ramaraja/Ramaraja-Regular.ttf?raw=true";
      name = "Ramaraja-Regular.ttf";
      sha256 = "9540e2a6d611b0f7e0852d64212091cad7a8f0af2128cbf391ee668c5699148f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Ramaraja-Regular.ttf $out/share/fonts/truetype/Ramaraja-Regular.ttf
  '';

  meta = with lib; {
    description = "Ramaraja";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
