{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "gluten-${version}";
  version = "2022-05-25-171121";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d9161816916ec715a3d4353a594ee583d938f122/ofl/gluten/Gluten%5Bslnt,wght%5D.ttf?raw=true";
      name = "Gluten_slnt,wght_.ttf";
      sha256 = "cb4b01e4754e36615125e7cb16fe1ec8255d1db02d0b236d7c992438dc1a83e4";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Gluten_slnt,wght_.ttf $out/share/fonts/truetype/Gluten_slnt,wght_.ttf
  '';

  meta = with lib; {
    description = "Gluten";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
