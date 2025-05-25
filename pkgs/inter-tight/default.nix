{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "inter-tight-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/intertight/InterTight%5Bwght%5D.ttf?raw=true";
      name = "InterTight_wght_.ttf";
      sha256 = "b81b73dcb64df3c230cabade7df6c5773bf863233f24c9ee51087519f1f88b6f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/intertight/InterTight-Italic%5Bwght%5D.ttf?raw=true";
      name = "InterTight-Italic_wght_.ttf";
      sha256 = "15d3edf0c3d2560658529b8c4c7398d06c730a4695484c680b6c9ca9e4385be2";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 InterTight_wght_.ttf $out/share/fonts/truetype/InterTight_wght_.ttf
     install -Dm644 InterTight-Italic_wght_.ttf $out/share/fonts/truetype/InterTight-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Inter Tight";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
