{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-dk-uloopet-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/playwritedkuloopet/PlaywriteDKUloopet%5Bwght%5D.ttf?raw=true";
      name = "PlaywriteDKUloopet_wght_.ttf";
      sha256 = "76656d24a0544bfcf28eea18e05d2b195e2e3adf6d12eac18a48138014e28f60";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteDKUloopet_wght_.ttf $out/share/fonts/truetype/PlaywriteDKUloopet_wght_.ttf
  '';

  meta = with lib; {
    description = "Playwrite DK Uloopet";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
