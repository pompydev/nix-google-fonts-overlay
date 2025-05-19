{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "comme-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/comme/Comme%5Bwght%5D.ttf?raw=true";
      name = "Comme_wght_.ttf";
      sha256 = "c368b2b9152d7c1e7d52f9dd058c2b01bab4dfb30c4b55097787083ef61f82e9";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Comme_wght_.ttf $out/share/fonts/truetype/Comme_wght_.ttf
  '';

  meta = with lib; {
    description = "Comme";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
