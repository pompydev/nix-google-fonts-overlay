{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "young-serif-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/youngserif/YoungSerif-Regular.ttf?raw=true";
      name = "YoungSerif-Regular.ttf";
      sha256 = "42bb2602364b28569fdce5eeb6ab3d81cf8090ba81b211f1229ed69f33155523";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 YoungSerif-Regular.ttf $out/share/fonts/truetype/YoungSerif-Regular.ttf
  '';

  meta = with lib; {
    description = "Young Serif";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
