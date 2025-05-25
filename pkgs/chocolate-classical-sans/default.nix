{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "chocolate-classical-sans-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/chocolateclassicalsans/ChocolateClassicalSans-Regular.ttf?raw=true";
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
