{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "roboto-slab-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/726818c7767f8d3eef97efc2d260979d406e5864/apache/robotoslab/RobotoSlab%5Bwght%5D.ttf?raw=true";
      name = "RobotoSlab_wght_.ttf";
      sha256 = "18137628b2731ac8d093c552b3a71abfc958bdb132ecf29a71614309c82836d9";
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
