{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-hr-lijeva-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/playwritehrlijeva/PlaywriteHRLijeva%5Bwght%5D.ttf?raw=true";
      name = "PlaywriteHRLijeva_wght_.ttf";
      sha256 = "bc2bca64bcbbf7630d27ae3f5641a86ee8bb8432dd8f3023e87ce4857d2c3a81";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteHRLijeva_wght_.ttf $out/share/fonts/truetype/PlaywriteHRLijeva_wght_.ttf
  '';

  meta = with lib; {
    description = "Playwrite HR Lijeva";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
