{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-es-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/playwritees/PlaywriteES%5Bwght%5D.ttf?raw=true";
      name = "PlaywriteES_wght_.ttf";
      sha256 = "512476f9454e976560fe7bde2896d7541a0ff3e1ea0a5fa97a543009f7e38921";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteES_wght_.ttf $out/share/fonts/truetype/PlaywriteES_wght_.ttf
  '';

  meta = with lib; {
    description = "Playwrite ES";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
