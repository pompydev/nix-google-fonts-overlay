{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-no-guides-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/playwritenoguides/PlaywriteNOGuides-Regular.ttf?raw=true";
      name = "PlaywriteNOGuides-Regular.ttf";
      sha256 = "517e97496d1a3921bef96178f6c66f48ababae63df07b77f45db5be384bb95d1";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteNOGuides-Regular.ttf $out/share/fonts/truetype/PlaywriteNOGuides-Regular.ttf
  '';

  meta = with lib; {
    description = "Playwrite NO Guides";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
