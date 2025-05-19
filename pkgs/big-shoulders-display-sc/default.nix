{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "big-shoulders-display-sc-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/bigshouldersdisplaysc/BigShouldersDisplaySC%5Bwght%5D.ttf?raw=true";
      name = "BigShouldersDisplaySC_wght_.ttf";
      sha256 = "919c655b8fcfffcb633f75a8c018d386d16f7d08365c86ed7560709dff3bfbd8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BigShouldersDisplaySC_wght_.ttf $out/share/fonts/truetype/BigShouldersDisplaySC_wght_.ttf
  '';

  meta = with lib; {
    description = "Big Shoulders Display SC";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
