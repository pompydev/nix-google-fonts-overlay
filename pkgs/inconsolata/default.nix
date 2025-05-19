{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "inconsolata-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/inconsolata/Inconsolata%5Bwdth,wght%5D.ttf?raw=true";
      name = "Inconsolata_wdth,wght_.ttf";
      sha256 = "23ded25b447074d00659392bf9b1123d89df55cb07b0ad9bfef3366d199b5fcb";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Inconsolata_wdth,wght_.ttf $out/share/fonts/truetype/Inconsolata_wdth,wght_.ttf
  '';

  meta = with lib; {
    description = "Inconsolata";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
