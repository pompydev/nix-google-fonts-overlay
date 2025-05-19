{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "roboto-condensed-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/robotocondensed/RobotoCondensed%5Bwght%5D.ttf?raw=true";
      name = "RobotoCondensed_wght_.ttf";
      sha256 = "dace262afcee68a5276f200d8026c57221735c0118ab5fda8c2c0d3dc409a8d0";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/robotocondensed/RobotoCondensed-Italic%5Bwght%5D.ttf?raw=true";
      name = "RobotoCondensed-Italic_wght_.ttf";
      sha256 = "78f643b1923008b00dfc9b371a2ecd4d80a017722925f1a3fac9940be56d1b7d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 RobotoCondensed_wght_.ttf $out/share/fonts/truetype/RobotoCondensed_wght_.ttf
     install -Dm644 RobotoCondensed-Italic_wght_.ttf $out/share/fonts/truetype/RobotoCondensed-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Roboto Condensed";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
