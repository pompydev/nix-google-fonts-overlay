{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "joan-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/joan/Joan-Regular.ttf?raw=true";
      name = "Joan-Regular.ttf";
      sha256 = "8777dccac8b33ee6fe4a0c7ab20e08cad20d7d10c18b0ce775e728f8e67be0e4";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Joan-Regular.ttf $out/share/fonts/truetype/Joan-Regular.ttf
  '';

  meta = with lib; {
    description = "Joan";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
