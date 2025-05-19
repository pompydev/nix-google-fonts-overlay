{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "yarndings-20-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/yarndings20/Yarndings20-Regular.ttf?raw=true";
      name = "Yarndings20-Regular.ttf";
      sha256 = "9479c85968eac65589c599b6b6322c2f8f834a43e76d8523d71f443483afcdc8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Yarndings20-Regular.ttf $out/share/fonts/truetype/Yarndings20-Regular.ttf
  '';

  meta = with lib; {
    description = "Yarndings 20";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
