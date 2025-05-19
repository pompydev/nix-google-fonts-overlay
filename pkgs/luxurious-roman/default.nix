{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "luxurious-roman-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/luxuriousroman/LuxuriousRoman-Regular.ttf?raw=true";
      name = "LuxuriousRoman-Regular.ttf";
      sha256 = "30d6bc4b25cf075560f0dd90a77a8ed8165bd280a863de1c3ab429fbf9ace58b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 LuxuriousRoman-Regular.ttf $out/share/fonts/truetype/LuxuriousRoman-Regular.ttf
  '';

  meta = with lib; {
    description = "Luxurious Roman";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
