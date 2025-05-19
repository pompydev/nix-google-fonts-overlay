{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "mynerve-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/mynerve/Mynerve-Regular.ttf?raw=true";
      name = "Mynerve-Regular.ttf";
      sha256 = "1844706b0020e74f1cc38810266f8c45741bd0d9b7beeb05a584caee11dbc63e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Mynerve-Regular.ttf $out/share/fonts/truetype/Mynerve-Regular.ttf
  '';

  meta = with lib; {
    description = "Mynerve";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
