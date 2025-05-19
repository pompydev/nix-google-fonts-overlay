{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "modak-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/modak/Modak-Regular.ttf?raw=true";
      name = "Modak-Regular.ttf";
      sha256 = "9a96ba056ddcbb7d0c937c52f744ff5d71004a97689b1fd2cdbd678f314db245";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Modak-Regular.ttf $out/share/fonts/truetype/Modak-Regular.ttf
  '';

  meta = with lib; {
    description = "Modak";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
