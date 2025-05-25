{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "josefin-slab-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/josefinslab/JosefinSlab%5Bwght%5D.ttf?raw=true";
      name = "JosefinSlab_wght_.ttf";
      sha256 = "52f8addf239848d129cfde96c3290b78e271ad657ef5645068d4f08046c2d1b8";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/josefinslab/JosefinSlab-Italic%5Bwght%5D.ttf?raw=true";
      name = "JosefinSlab-Italic_wght_.ttf";
      sha256 = "2629d8e5c81bf652f096179d89e525c3d02824307cdd10852053979fe72c8ee9";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 JosefinSlab_wght_.ttf $out/share/fonts/truetype/JosefinSlab_wght_.ttf
     install -Dm644 JosefinSlab-Italic_wght_.ttf $out/share/fonts/truetype/JosefinSlab-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Josefin Slab";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
