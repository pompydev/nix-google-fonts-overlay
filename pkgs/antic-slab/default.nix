{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "antic-slab-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/anticslab/AnticSlab-Regular.ttf?raw=true";
      name = "AnticSlab-Regular.ttf";
      sha256 = "bea5831a412ccf18bf34612a575d908b7892c4669fa91b80405cba508fc32a56";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AnticSlab-Regular.ttf $out/share/fonts/truetype/AnticSlab-Regular.ttf
  '';

  meta = with lib; {
    description = "Antic Slab";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
