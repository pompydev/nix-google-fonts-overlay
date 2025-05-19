{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "emilys-candy-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/emilyscandy/EmilysCandy-Regular.ttf?raw=true";
      name = "EmilysCandy-Regular.ttf";
      sha256 = "0cf3ca9dbe71b33596e8a1eb12b40deac2e6414fe5616dda50c554580b6e0c68";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 EmilysCandy-Regular.ttf $out/share/fonts/truetype/EmilysCandy-Regular.ttf
  '';

  meta = with lib; {
    description = "Emilys Candy";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
