{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-nl-guides-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/playwritenlguides/PlaywriteNLGuides-Regular.ttf?raw=true";
      name = "PlaywriteNLGuides-Regular.ttf";
      sha256 = "af88d12c8284fe2c2fe064755db673eb4419a574a3fca28ee429c8d9c60d66ec";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteNLGuides-Regular.ttf $out/share/fonts/truetype/PlaywriteNLGuides-Regular.ttf
  '';

  meta = with lib; {
    description = "Playwrite NL Guides";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
