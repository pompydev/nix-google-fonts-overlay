{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "big-shoulders-inline-text-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/bigshouldersinlinetext/BigShouldersInlineText%5Bwght%5D.ttf?raw=true";
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
