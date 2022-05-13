{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "patrick-hand-sc-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d08233f9c581786e8c834a1f0695a4f27869c119/ofl/patrickhandsc/PatrickHandSC-Regular.ttf?raw=true";
      name = "PatrickHandSC-Regular.ttf";
      sha256 = "83eff88cfa3c4e501e25f334c0a1a88eb4d4af1ea9d4c32900edf2fb178244dc";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PatrickHandSC-Regular.ttf $out/share/fonts/truetype/PatrickHandSC-Regular.ttf
  '';

  meta = with lib; {
    description = "Patrick Hand SC";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
