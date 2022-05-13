{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "montagu-slab-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/60dc03fb1238cbb20a5f712759c24b286b67d77f/ofl/montaguslab/MontaguSlab[opsz,wght].ttf?raw=true";
      name = "MontaguSlab[opsz,wght].ttf";
      sha256 = "26fe25e6f5221fa48b97807d9666bbf36e7486bc7853676b24bb631373e8a505";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'MontaguSlab[opsz,wght].ttf' $out/share/fonts/truetype/'MontaguSlab[opsz,wght].ttf'
  '';

  meta = with lib; {
    description = "Montagu Slab";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
