{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "reggae-one-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/reggaeone/ReggaeOne-Regular.ttf?raw=true";
      name = "ReggaeOne-Regular.ttf";
      sha256 = "aebe62598732d76036f30ec11bb0ec5f68938e373a06d1b4ceb6b9cf1abf3db2";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ReggaeOne-Regular.ttf $out/share/fonts/truetype/ReggaeOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Reggae One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
