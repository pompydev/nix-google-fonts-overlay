{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ntr-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/ntr/NTR-Regular.ttf?raw=true";
      name = "NTR-Regular.ttf";
      sha256 = "c59000b9a002c2935b19afdceaa3aac9b0edefcfd213e3f64de0b172fda50b1d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NTR-Regular.ttf $out/share/fonts/truetype/NTR-Regular.ttf
  '';

  meta = with lib; {
    description = "NTR";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
