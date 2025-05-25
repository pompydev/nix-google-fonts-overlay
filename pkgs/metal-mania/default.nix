{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "metal-mania-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/metalmania/MetalMania-Regular.ttf?raw=true";
      name = "MetalMania-Regular.ttf";
      sha256 = "4b95f0e55b291990c26a7b68818b20c1b728a8be05a34982b7bb4736c46c19ea";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 MetalMania-Regular.ttf $out/share/fonts/truetype/MetalMania-Regular.ttf
  '';

  meta = with lib; {
    description = "Metal Mania";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
