{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "montagu-slab-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/montaguslab/MontaguSlab%5Bopsz,wght%5D.ttf?raw=true";
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
     install -Dm644 MontaguSlab_opsz-wght_.ttf $out/share/fonts/truetype/MontaguSlab_opsz-wght_.ttf
  '';

  meta = with lib; {
    description = "Montagu Slab";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
