{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-in-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/playwritein/PlaywriteIN%5Bwght%5D.ttf?raw=true";
      name = "PlaywriteIN_wght_.ttf";
      sha256 = "77478b44a7a14c42627cb0aa3f5c0058e5aca1338a6d43228cb4adb0a4754c2c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteIN_wght_.ttf $out/share/fonts/truetype/PlaywriteIN_wght_.ttf
  '';

  meta = with lib; {
    description = "Playwrite IN";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
