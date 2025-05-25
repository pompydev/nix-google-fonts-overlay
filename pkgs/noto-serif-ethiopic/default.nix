{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-ethiopic-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notoserifethiopic/NotoSerifEthiopic%5Bwdth,wght%5D.ttf?raw=true";
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
     install -Dm644 NotoSerifEthiopic_wdth-wght_.ttf $out/share/fonts/truetype/NotoSerifEthiopic_wdth-wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Serif Ethiopic";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
