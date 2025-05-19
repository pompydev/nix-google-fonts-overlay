{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "sen-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/sen/Sen%5Bwght%5D.ttf?raw=true";
      name = "Sen_wght_.ttf";
      sha256 = "5a2d5777100be28024b4f28505d678c006bc52e9d9fa78f554a1252b5f254c77";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Sen_wght_.ttf $out/share/fonts/truetype/Sen_wght_.ttf
  '';

  meta = with lib; {
    description = "Sen";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
