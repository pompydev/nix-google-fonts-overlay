{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "roboto-slab-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/apache/robotoslab/RobotoSlab%5Bwght%5D.ttf?raw=true";
      name = "RobotoSlab_wght_.ttf";
      sha256 = "786ae192477447d33c6672c3055fba7cbfe45184c9a79e77a14f15716ca05b16";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 RobotoSlab_wght_.ttf $out/share/fonts/truetype/RobotoSlab_wght_.ttf
  '';

  meta = with lib; {
    description = "Roboto Slab";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
