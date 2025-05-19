{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-za-guides-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/playwritezaguides/PlaywriteZAGuides-Regular.ttf?raw=true";
      name = "PlaywriteZAGuides-Regular.ttf";
      sha256 = "6bb09ad44587fc3482dd0238490dac4fed054879cf5015eb40e5ac875cca15a8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteZAGuides-Regular.ttf $out/share/fonts/truetype/PlaywriteZAGuides-Regular.ttf
  '';

  meta = with lib; {
    description = "Playwrite ZA Guides";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
