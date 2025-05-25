{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "big-shoulders-inline-text-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/bigshouldersinlinetext/BigShouldersInlineText%5Bwght%5D.ttf?raw=true";
      name = "BigShouldersInlineText_wght_.ttf";
      sha256 = "e1da2aa867fb756db228ba6d0e9954e1076706a4eaa9471fee8f255a4c30a13f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BigShouldersInlineText_wght_.ttf $out/share/fonts/truetype/BigShouldersInlineText_wght_.ttf
  '';

  meta = with lib; {
    description = "Big Shoulders Inline Text";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
