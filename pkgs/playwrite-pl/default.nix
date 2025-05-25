{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-pl-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/playwritepl/PlaywritePL%5Bwght%5D.ttf?raw=true";
      name = "PlaywritePL_wght_.ttf";
      sha256 = "f1c9acaad13fddb86bc37be5c54f0b5b6afcede87a2237a5c8421411e20bcba3";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywritePL_wght_.ttf $out/share/fonts/truetype/PlaywritePL_wght_.ttf
  '';

  meta = with lib; {
    description = "Playwrite PL";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
