{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "allura-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/207719137a61f71c2f9aa363b0df1dae1b5cc9a9/ofl/allura/Allura-Regular.ttf?raw=true";
      name = "Allura-Regular.ttf";
      sha256 = "2fbe9174896b8afa1140936dc44a34daf3948c766b20a0b1b4155805a2d5bba4";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Allura-Regular.ttf $out/share/fonts/truetype/Allura-Regular.ttf
  '';

  meta = with lib; {
    description = "Allura";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
