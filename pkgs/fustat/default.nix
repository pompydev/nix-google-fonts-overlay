{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "fustat-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/fustat/Fustat%5Bwght%5D.ttf?raw=true";
      name = "Fustat_wght_.ttf";
      sha256 = "ba09d90e6180e79334aadd42ea1ed0e97a405fadcd34412c1d02a6b8f679d402";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Fustat_wght_.ttf $out/share/fonts/truetype/Fustat_wght_.ttf
  '';

  meta = with lib; {
    description = "Fustat";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
