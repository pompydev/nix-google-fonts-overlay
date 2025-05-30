{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-ng-modern-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/playwritengmodern/PlaywriteNGModern%5Bwght%5D.ttf?raw=true";
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
