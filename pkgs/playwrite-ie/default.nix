{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-ie-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/playwriteie/PlaywriteIE%5Bwght%5D.ttf?raw=true";
      name = "PlaywriteIE_wght_.ttf";
      sha256 = "86b4051bfccbeae76d787af06bb788e2299035798bf265c8a1fcc52cfb5f2648";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteIE_wght_.ttf $out/share/fonts/truetype/PlaywriteIE_wght_.ttf
  '';

  meta = with lib; {
    description = "Playwrite IE";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
