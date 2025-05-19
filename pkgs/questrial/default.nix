{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "questrial-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/questrial/Questrial-Regular.ttf?raw=true";
      name = "Questrial-Regular.ttf";
      sha256 = "0ee7f2debabb13773fd38468b31820e11fca202a8f98c4d80b6ffcb796899b6f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Questrial-Regular.ttf $out/share/fonts/truetype/Questrial-Regular.ttf
  '';

  meta = with lib; {
    description = "Questrial";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
