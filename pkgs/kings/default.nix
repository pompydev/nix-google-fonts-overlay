{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "kings-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/kings/Kings-Regular.ttf?raw=true";
      name = "Kings-Regular.ttf";
      sha256 = "80dda73b13254d50173af1dbad3f7321b99ca61d791ebb8cd5fb8be0846c39bb";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Kings-Regular.ttf $out/share/fonts/truetype/Kings-Regular.ttf
  '';

  meta = with lib; {
    description = "Kings";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
