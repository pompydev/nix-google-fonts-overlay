{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "sawarabi-gothic-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/sawarabigothic/SawarabiGothic-Regular.ttf?raw=true";
      name = "SawarabiGothic-Regular.ttf";
      sha256 = "04f2f9111bb69cb8d3706c27b44879c2c0fac593a11edf5cfe8cec1efc92c789";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SawarabiGothic-Regular.ttf $out/share/fonts/truetype/SawarabiGothic-Regular.ttf
  '';

  meta = with lib; {
    description = "Sawarabi Gothic";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
