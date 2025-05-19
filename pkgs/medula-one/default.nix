{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "medula-one-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/medulaone/MedulaOne-Regular.ttf?raw=true";
      name = "MedulaOne-Regular.ttf";
      sha256 = "ec96fcb6468878d6ce17334214421f4c01bb97ebe0a89bee6e22352929f60f2a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 MedulaOne-Regular.ttf $out/share/fonts/truetype/MedulaOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Medula One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
