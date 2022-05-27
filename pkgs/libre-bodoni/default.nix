{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "libre-bodoni-${version}";
  version = "2022-05-23-214203";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8c9641917db6868b3b0ea8b88882c65c11e09453/ofl/librebodoni/LibreBodoni%5Bwght%5D.ttf?raw=true";
      name = "LibreBodoni_wght_.ttf";
      sha256 = "eb40812b2fdb250e3dad9c38f8b2bffe4c66f778a1299ec32622005ff4f0996d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8c9641917db6868b3b0ea8b88882c65c11e09453/ofl/librebodoni/LibreBodoni-Italic%5Bwght%5D.ttf?raw=true";
      name = "LibreBodoni-Italic_wght_.ttf";
      sha256 = "53df41b370bb6745621eab290a72ea42e4237fcc303c875f550d5bb7bc446595";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 LibreBodoni_wght_.ttf $out/share/fonts/truetype/LibreBodoni_wght_.ttf
     install -Dm644 LibreBodoni-Italic_wght_.ttf $out/share/fonts/truetype/LibreBodoni-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Libre Bodoni";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
