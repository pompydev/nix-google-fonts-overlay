{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "imprima-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/imprima/Imprima-Regular.ttf?raw=true";
      name = "Imprima-Regular.ttf";
      sha256 = "c563e40bc5609b8c7bcc39f93cba05455c0d0b8c43460ff991d2834301609c08";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Imprima-Regular.ttf $out/share/fonts/truetype/Imprima-Regular.ttf
  '';

  meta = with lib; {
    description = "Imprima";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
