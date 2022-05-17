{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "vibes-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7806635558e2d5bd44254eae993df47c077d1330/ofl/vibes/Vibes-Regular.ttf?raw=true";
      name = "Vibes-Regular.ttf";
      sha256 = "297d9c8499e7383ac7675932741625ab12d9bb3abd1c31d2659b385d965a7ab7";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Vibes-Regular.ttf $out/share/fonts/truetype/Vibes-Regular.ttf
  '';

  meta = with lib; {
    description = "Vibes";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
