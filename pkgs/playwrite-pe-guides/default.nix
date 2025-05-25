{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-pe-guides-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/playwritepeguides/PlaywritePEGuides-Regular.ttf?raw=true";
      name = "PlaywritePEGuides-Regular.ttf";
      sha256 = "e823372874caa13a919a248a642efeb5385a2b62f35195ca1d7669ab84e98409";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywritePEGuides-Regular.ttf $out/share/fonts/truetype/PlaywritePEGuides-Regular.ttf
  '';

  meta = with lib; {
    description = "Playwrite PE Guides";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
