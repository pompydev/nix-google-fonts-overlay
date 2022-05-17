{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "metal-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4f5dbdb58c9075640112a760b0f2376ab04cd187/ofl/metal/Metal-Regular.ttf?raw=true";
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
