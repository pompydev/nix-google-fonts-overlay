{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "metal-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/metal/Metal-Regular.ttf?raw=true";
      name = "Metal-Regular.ttf";
      sha256 = "3718096fff5cf6a76005fdcb786c7f321f496fe6d56fbcb7f664c12c433d8413";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Metal-Regular.ttf $out/share/fonts/truetype/Metal-Regular.ttf
  '';

  meta = with lib; {
    description = "Metal";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
