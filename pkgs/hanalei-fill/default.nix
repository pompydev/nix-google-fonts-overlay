{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "hanalei-fill-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/hanaleifill/HanaleiFill-Regular.ttf?raw=true";
      name = "HanaleiFill-Regular.ttf";
      sha256 = "1916f208a0e8c2d1b9535e26f8f77e45b641e98f9bf16e809cdd478367b641db";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 HanaleiFill-Regular.ttf $out/share/fonts/truetype/HanaleiFill-Regular.ttf
  '';

  meta = with lib; {
    description = "Hanalei Fill";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
