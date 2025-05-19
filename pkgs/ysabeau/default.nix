{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ysabeau-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/ysabeau/Ysabeau%5Bwght%5D.ttf?raw=true";
      name = "Ysabeau_wght_.ttf";
      sha256 = "aa6df9f1f6cb1180f7c00fffb5ae2734ba66aa5f58defd173a9247ca11dffcf4";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/ysabeau/Ysabeau-Italic%5Bwght%5D.ttf?raw=true";
      name = "Ysabeau-Italic_wght_.ttf";
      sha256 = "6d9099e463926e46659e01e415f891af967ec65a1fa5c496ec2b6612e4d3e27c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Ysabeau_wght_.ttf $out/share/fonts/truetype/Ysabeau_wght_.ttf
     install -Dm644 Ysabeau-Italic_wght_.ttf $out/share/fonts/truetype/Ysabeau-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Ysabeau";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
