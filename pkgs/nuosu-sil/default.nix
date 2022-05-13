{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "nuosu-sil-${version}";
  version = "2022-04-28-101719";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f02ae1b6160f938704f00fbeee26c9f708bbe27c/ofl/nuosusil/NuosuSIL-Regular.ttf?raw=true";
      name = "NuosuSIL-Regular.ttf";
      sha256 = "3ca4e30180b7575e724554c5d7cf324bc8be3dd56c5ef1de0627c683952032cd";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NuosuSIL-Regular.ttf $out/share/fonts/truetype/NuosuSIL-Regular.ttf
  '';

  meta = with lib; {
    description = "Nuosu SIL";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
