{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "love-ya-like-a-sister-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/loveyalikeasister/LoveYaLikeASister.ttf?raw=true";
      name = "LoveYaLikeASister.ttf";
      sha256 = "4fbe2c1fa647de5a415acac7b2b6491542fe9767b6199719a3bd77a7cf35eb0d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 LoveYaLikeASister.ttf $out/share/fonts/truetype/LoveYaLikeASister.ttf
  '';

  meta = with lib; {
    description = "Love Ya Like A Sister";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
