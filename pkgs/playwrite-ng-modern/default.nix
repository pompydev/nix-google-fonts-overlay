{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-ng-modern-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/playwritengmodern/PlaywriteNGModern%5Bwght%5D.ttf?raw=true";
      name = "PlaywriteNGModern_wght_.ttf";
      sha256 = "73450c1ba004936e0bc41aaa99e366ead8ca43126ca7eb74e7242ede0b5a8020";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteNGModern_wght_.ttf $out/share/fonts/truetype/PlaywriteNGModern_wght_.ttf
  '';

  meta = with lib; {
    description = "Playwrite NG Modern";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
