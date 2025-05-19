{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "devonshire-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/devonshire/Devonshire-Regular.ttf?raw=true";
      name = "Devonshire-Regular.ttf";
      sha256 = "4c00f003570e5a99361cc83017cb1314aa3170cfaa53be29a08c555bbb434657";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Devonshire-Regular.ttf $out/share/fonts/truetype/Devonshire-Regular.ttf
  '';

  meta = with lib; {
    description = "Devonshire";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
