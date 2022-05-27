{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "spline-sans-mono-${version}";
  version = "2022-05-25-144440";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/926666b01c84f852f4203e8382ba7e2379cdade7/ofl/splinesansmono/SplineSansMono%5Bwght%5D.ttf?raw=true";
      name = "SplineSansMono_wght_.ttf";
      sha256 = "e20c1df32aa2f886e828cfcc81ca5c405d3f3b160990f6b892923e2e449bf525";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/926666b01c84f852f4203e8382ba7e2379cdade7/ofl/splinesansmono/SplineSansMono-Italic%5Bwght%5D.ttf?raw=true";
      name = "SplineSansMono-Italic_wght_.ttf";
      sha256 = "073f111f37a86cc6d952b7870b3c1aebbfc78f4056dd3996db28bbc7166667a6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SplineSansMono_wght_.ttf $out/share/fonts/truetype/SplineSansMono_wght_.ttf
     install -Dm644 SplineSansMono-Italic_wght_.ttf $out/share/fonts/truetype/SplineSansMono-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Spline Sans Mono";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
