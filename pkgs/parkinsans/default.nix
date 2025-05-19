{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "parkinsans-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/parkinsans/Parkinsans%5Bwght%5D.ttf?raw=true";
      name = "Parkinsans_wght_.ttf";
      sha256 = "a4e64caa56ec94dcc82335be924e68c2a4a24544646d819abffe035d87158fa8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Parkinsans_wght_.ttf $out/share/fonts/truetype/Parkinsans_wght_.ttf
  '';

  meta = with lib; {
    description = "Parkinsans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
