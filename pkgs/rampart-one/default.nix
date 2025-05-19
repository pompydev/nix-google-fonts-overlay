{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "rampart-one-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/rampartone/RampartOne-Regular.ttf?raw=true";
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
