{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-in-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/playwritein/PlaywriteIN%5Bwght%5D.ttf?raw=true";
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
