{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-de-sas-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/playwritedesas/PlaywriteDESAS%5Bwght%5D.ttf?raw=true";
      name = "PlaywriteDESAS_wght_.ttf";
      sha256 = "5c66767e8db56ff661215964bd3372e8d87122a7a9259486d500d791fe328065";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteDESAS_wght_.ttf $out/share/fonts/truetype/PlaywriteDESAS_wght_.ttf
  '';

  meta = with lib; {
    description = "Playwrite DE SAS";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
