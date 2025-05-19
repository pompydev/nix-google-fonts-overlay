{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "big-shoulders-display-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/bigshouldersdisplay/BigShouldersDisplay%5Bwght%5D.ttf?raw=true";
      name = "BigShouldersDisplay_wght_.ttf";
      sha256 = "60e208dc276a1c35fc5b62e94f9fb959c40c11783a9eb7548175c14b1fbeb720";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BigShouldersDisplay_wght_.ttf $out/share/fonts/truetype/BigShouldersDisplay_wght_.ttf
  '';

  meta = with lib; {
    description = "Big Shoulders Display";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
