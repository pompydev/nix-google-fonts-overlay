{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-todhri-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notoseriftodhri/NotoSerifTodhri-Regular.ttf?raw=true";
      name = "NotoSerifTodhri-Regular.ttf";
      sha256 = "d2c1afe671b637345e7045fcd0b4a4dca35c55811a7811de486b77f1b035008f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSerifTodhri-Regular.ttf $out/share/fonts/truetype/NotoSerifTodhri-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Serif Todhri";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
