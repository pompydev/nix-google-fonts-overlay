{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "lugrasimo-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/lugrasimo/Lugrasimo-Regular.ttf?raw=true";
      name = "Lugrasimo-Regular.ttf";
      sha256 = "5a8a7b736bfb38c4fa32b0dc82591e5cddc46a52905866d79a4f8050fe40d0c6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Lugrasimo-Regular.ttf $out/share/fonts/truetype/Lugrasimo-Regular.ttf
  '';

  meta = with lib; {
    description = "Lugrasimo";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
