{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ole-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7466c507e856bbefe654743ce6bcd35c0c0264e3/ofl/ole/Ole-Regular.ttf?raw=true";
      name = "Ole-Regular.ttf";
      sha256 = "6071527486096be714c64a8b04181f78556cba14a95f596323c0d3560e406e73";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Ole-Regular.ttf $out/share/fonts/truetype/Ole-Regular.ttf
  '';

  meta = with lib; {
    description = "Ole";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
