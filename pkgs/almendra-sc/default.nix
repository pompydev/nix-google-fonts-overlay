{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "almendra-sc-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/almendrasc/AlmendraSC-Regular.ttf?raw=true";
      name = "AlmendraSC-Regular.ttf";
      sha256 = "dca733b5b03e4ea52c666365777c8f6b360d55de04efc9d834cf9f82b68308be";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AlmendraSC-Regular.ttf $out/share/fonts/truetype/AlmendraSC-Regular.ttf
  '';

  meta = with lib; {
    description = "Almendra SC";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
