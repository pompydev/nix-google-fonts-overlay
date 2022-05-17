{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "jomolhari-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/636da261d0d2ef4ef9344ba15754e914d634a863/ofl/jomolhari/Jomolhari-Regular.ttf?raw=true";
      name = "Jomolhari-Regular.ttf";
      sha256 = "4507597ac6d8faad3908c06a4698167f8204a1101d38bf32b04582cc2d22e86c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Jomolhari-Regular.ttf $out/share/fonts/truetype/Jomolhari-Regular.ttf
  '';

  meta = with lib; {
    description = "Jomolhari";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
