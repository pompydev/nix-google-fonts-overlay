{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "potta-one-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/pottaone/PottaOne-Regular.ttf?raw=true";
      name = "PottaOne-Regular.ttf";
      sha256 = "bde843868b56e429e1c863da2efa76df533162b226d990efcb96d533b0ca2a93";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PottaOne-Regular.ttf $out/share/fonts/truetype/PottaOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Potta One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
