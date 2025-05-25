{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "big-shoulders-inline-text-sc-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/bigshouldersinlinetextsc/BigShouldersInlineTextSC%5Bwght%5D.ttf?raw=true";
      name = "BigShouldersInlineTextSC_wght_.ttf";
      sha256 = "28ccd62c3931f32c31bb6d34f5338f369a556b92cbb2ba6ec45d748c562c08ed";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BigShouldersInlineTextSC_wght_.ttf $out/share/fonts/truetype/BigShouldersInlineTextSC_wght_.ttf
  '';

  meta = with lib; {
    description = "Big Shoulders Inline Text SC";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
