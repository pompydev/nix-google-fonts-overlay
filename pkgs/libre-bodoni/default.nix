{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "libre-bodoni-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8c9641917db6868b3b0ea8b88882c65c11e09453/ofl/librebodoni/LibreBodoni[wght].ttf?raw=true";
      name = "LibreBodoni[wght].ttf";
      sha256 = "eb40812b2fdb250e3dad9c38f8b2bffe4c66f778a1299ec32622005ff4f0996d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8c9641917db6868b3b0ea8b88882c65c11e09453/ofl/librebodoni/LibreBodoni-Italic[wght].ttf?raw=true";
      name = "LibreBodoni-Italic[wght].ttf";
      sha256 = "53df41b370bb6745621eab290a72ea42e4237fcc303c875f550d5bb7bc446595";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'LibreBodoni[wght].ttf' $out/share/fonts/truetype/'LibreBodoni[wght].ttf'
     install -Dm644 'LibreBodoni-Italic[wght].ttf' $out/share/fonts/truetype/'LibreBodoni-Italic[wght].ttf'
  '';

  meta = with lib; {
    description = "Libre Bodoni";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
