{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "allerta-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/allerta/Allerta-Regular.ttf?raw=true";
      name = "Allerta-Regular.ttf";
      sha256 = "9c7a63f78f944353b422abbb641c479503f5292a39d1ea932dc4186fd82b974f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Allerta-Regular.ttf $out/share/fonts/truetype/Allerta-Regular.ttf
  '';

  meta = with lib; {
    description = "Allerta";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
