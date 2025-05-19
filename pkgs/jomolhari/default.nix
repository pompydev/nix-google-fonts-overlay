{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "jomolhari-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/jomolhari/Jomolhari-Regular.ttf?raw=true";
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
