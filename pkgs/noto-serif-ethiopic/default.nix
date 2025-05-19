{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-ethiopic-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notoserifethiopic/NotoSerifEthiopic%5Bwdth,wght%5D.ttf?raw=true";
      name = "NotoSerifEthiopic_wdth,wght_.ttf";
      sha256 = "49d5daa6c3477a427f5d4f8a5ae9ea7f0a04ea7f865fc21f7e08fc4aed70d92a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSerifEthiopic_wdth,wght_.ttf $out/share/fonts/truetype/NotoSerifEthiopic_wdth,wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Serif Ethiopic";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
