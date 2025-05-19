{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-nl-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/playwritenl/PlaywriteNL%5Bwght%5D.ttf?raw=true";
      name = "PlaywriteNL_wght_.ttf";
      sha256 = "e64eacdbb78c16aba09009a8946158472e1b0ec45a9e4a530e33f6f6bc252c5a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteNL_wght_.ttf $out/share/fonts/truetype/PlaywriteNL_wght_.ttf
  '';

  meta = with lib; {
    description = "Playwrite NL";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
