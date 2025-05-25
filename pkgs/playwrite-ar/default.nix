{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-ar-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/playwritear/PlaywriteAR%5Bwght%5D.ttf?raw=true";
      name = "PlaywriteAR_wght_.ttf";
      sha256 = "4b419fee311f18e3cd5d3f4aac838d9e80b5dc2cbb97dd4ee9d79171716d619a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteAR_wght_.ttf $out/share/fonts/truetype/PlaywriteAR_wght_.ttf
  '';

  meta = with lib; {
    description = "Playwrite AR";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
