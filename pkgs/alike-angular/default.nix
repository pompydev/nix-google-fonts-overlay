{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "alike-angular-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/alikeangular/AlikeAngular-Regular.ttf?raw=true";
      name = "AlikeAngular-Regular.ttf";
      sha256 = "3706438e11bb219d6dbbb19958b637dc19470638da28fd97a620f7d7069bf448";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AlikeAngular-Regular.ttf $out/share/fonts/truetype/AlikeAngular-Regular.ttf
  '';

  meta = with lib; {
    description = "Alike Angular";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
