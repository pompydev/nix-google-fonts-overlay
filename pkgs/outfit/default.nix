{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "outfit-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/outfit/Outfit%5Bwght%5D.ttf?raw=true";
      name = "Outfit_wght_.ttf";
      sha256 = "fc7287273e66929776e2ba54f144fe699080bec29f61bf649d70d871468aeade";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Outfit_wght_.ttf $out/share/fonts/truetype/Outfit_wght_.ttf
  '';

  meta = with lib; {
    description = "Outfit";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
