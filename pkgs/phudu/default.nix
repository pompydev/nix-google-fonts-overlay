{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "phudu-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/phudu/Phudu%5Bwght%5D.ttf?raw=true";
      name = "Phudu_wght_.ttf";
      sha256 = "56dfb12f5f7b6a851f3638cf975d7733fbcaba0a8f81865513f025730e3536a0";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Phudu_wght_.ttf $out/share/fonts/truetype/Phudu_wght_.ttf
  '';

  meta = with lib; {
    description = "Phudu";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
