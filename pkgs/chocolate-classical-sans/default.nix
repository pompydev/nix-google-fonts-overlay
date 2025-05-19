{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "chocolate-classical-sans-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/chocolateclassicalsans/ChocolateClassicalSans-Regular.ttf?raw=true";
      name = "ChocolateClassicalSans-Regular.ttf";
      sha256 = "fdab4ba8ed63e38317fc6a66efdf4a93b5bce9d18b88f649a0ba8491ce5b0568";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ChocolateClassicalSans-Regular.ttf $out/share/fonts/truetype/ChocolateClassicalSans-Regular.ttf
  '';

  meta = with lib; {
    description = "Chocolate Classical Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
