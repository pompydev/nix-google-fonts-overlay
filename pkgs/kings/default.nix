{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "kings-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/kings/Kings-Regular.ttf?raw=true";
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
