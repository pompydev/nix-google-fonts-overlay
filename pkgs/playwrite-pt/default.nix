{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-pt-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/playwritept/PlaywritePT%5Bwght%5D.ttf?raw=true";
      name = "PlaywritePT_wght_.ttf";
      sha256 = "82e069715f5cdc5a59998bac55d938956266c7283f685b6d48bc145103cb29f1";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywritePT_wght_.ttf $out/share/fonts/truetype/PlaywritePT_wght_.ttf
  '';

  meta = with lib; {
    description = "Playwrite PT";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
