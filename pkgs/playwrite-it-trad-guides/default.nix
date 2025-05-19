{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-it-trad-guides-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/playwriteittradguides/PlaywriteITTradGuides-Regular.ttf?raw=true";
      name = "PlaywriteITTradGuides-Regular.ttf";
      sha256 = "ccbf16933be4d643802b4125dce67d64eb1cde0dcde9a44becf7f5c82c49522e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteITTradGuides-Regular.ttf $out/share/fonts/truetype/PlaywriteITTradGuides-Regular.ttf
  '';

  meta = with lib; {
    description = "Playwrite IT Trad Guides";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
