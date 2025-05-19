{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-tz-guides-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/playwritetzguides/PlaywriteTZGuides-Regular.ttf?raw=true";
      name = "PlaywriteTZGuides-Regular.ttf";
      sha256 = "6f24f117c1fb0f28ea8e64694ebc49e3cc12f849caba551504be7f5a9ef9f786";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteTZGuides-Regular.ttf $out/share/fonts/truetype/PlaywriteTZGuides-Regular.ttf
  '';

  meta = with lib; {
    description = "Playwrite TZ Guides";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
