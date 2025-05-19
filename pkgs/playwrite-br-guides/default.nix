{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-br-guides-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/playwritebrguides/PlaywriteBRGuides-Regular.ttf?raw=true";
      name = "PlaywriteBRGuides-Regular.ttf";
      sha256 = "786c43baaccdb32eab7f1ae43ee9737d038272ddfdecbba9b822f867d07eb73e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteBRGuides-Regular.ttf $out/share/fonts/truetype/PlaywriteBRGuides-Regular.ttf
  '';

  meta = with lib; {
    description = "Playwrite BR Guides";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
