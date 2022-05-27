{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "potta-one-${version}";
  version = "2022-05-23-231859";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9a4e0fa082388b270a531a794a00845291230db5/ofl/pottaone/PottaOne-Regular.ttf?raw=true";
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
