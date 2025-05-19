{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "montez-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/apache/montez/Montez-Regular.ttf?raw=true";
      name = "Montez-Regular.ttf";
      sha256 = "f58fc790f20cf612393737bb90c4ac418eea72147e988182f4eb7ee57f4639f3";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Montez-Regular.ttf $out/share/fonts/truetype/Montez-Regular.ttf
  '';

  meta = with lib; {
    description = "Montez";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
