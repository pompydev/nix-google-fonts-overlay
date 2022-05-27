{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "rampart-one-${version}";
  version = "2022-05-23-231859";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/40d0d88683b81fe307092951138cf81e626f621a/ofl/rampartone/RampartOne-Regular.ttf?raw=true";
      name = "RampartOne-Regular.ttf";
      sha256 = "a4c60ee835175fa147eb483fac0dd8ff9007c37884ef77af86b0a868fa554d49";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 RampartOne-Regular.ttf $out/share/fonts/truetype/RampartOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Rampart One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
