{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "rubik-distressed-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/rubikdistressed/RubikDistressed-Regular.ttf?raw=true";
      name = "RubikDistressed-Regular.ttf";
      sha256 = "64a9962c862451507b5d8dbc1c4bf023ddbcad701bc73d277eae46723718327a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 RubikDistressed-Regular.ttf $out/share/fonts/truetype/RubikDistressed-Regular.ttf
  '';

  meta = with lib; {
    description = "Rubik Distressed";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
