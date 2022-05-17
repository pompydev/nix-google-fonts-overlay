{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "montagu-slab-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/60dc03fb1238cbb20a5f712759c24b286b67d77f/ofl/montaguslab/MontaguSlab%5Bopsz,wght%5D.ttf?raw=true";
      name = "MontaguSlab_opsz,wght_.ttf";
      sha256 = "26fe25e6f5221fa48b97807d9666bbf36e7486bc7853676b24bb631373e8a505";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 MontaguSlab_opsz,wght_.ttf $out/share/fonts/truetype/MontaguSlab_opsz,wght_.ttf
  '';

  meta = with lib; {
    description = "Montagu Slab";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
