{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "galada-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/galada/Galada-Regular.ttf?raw=true";
      name = "Galada-Regular.ttf";
      sha256 = "acc22b41ee470dc542e15b5f8907c7fbebef1b9c01eb20e4127bdbf052b006ee";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Galada-Regular.ttf $out/share/fonts/truetype/Galada-Regular.ttf
  '';

  meta = with lib; {
    description = "Galada";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
