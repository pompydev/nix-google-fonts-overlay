{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-ie-guides-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/playwriteieguides/PlaywriteIEGuides-Regular.ttf?raw=true";
      name = "PlaywriteIEGuides-Regular.ttf";
      sha256 = "f6ca866bd7525359a7a06903607a10dcc7e339b5d3e85ad8d5066f1a1d3e1228";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteIEGuides-Regular.ttf $out/share/fonts/truetype/PlaywriteIEGuides-Regular.ttf
  '';

  meta = with lib; {
    description = "Playwrite IE Guides";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
