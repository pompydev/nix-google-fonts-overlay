{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "arbutus-slab-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/arbutusslab/ArbutusSlab-Regular.ttf?raw=true";
      name = "ArbutusSlab-Regular.ttf";
      sha256 = "f4f55a6e95aa0dcad40077d4b4e9f7d0269ed2ca448134917c97d59c474e511c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ArbutusSlab-Regular.ttf $out/share/fonts/truetype/ArbutusSlab-Regular.ttf
  '';

  meta = with lib; {
    description = "Arbutus Slab";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
