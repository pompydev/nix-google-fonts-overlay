{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "big-shoulders-display-${version}";
  version = "2022-05-23-211740";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/94ee6b8b988ef08c912b463d697e51d1658cf6e8/ofl/bigshouldersdisplay/BigShouldersDisplay%5Bwght%5D.ttf?raw=true";
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
