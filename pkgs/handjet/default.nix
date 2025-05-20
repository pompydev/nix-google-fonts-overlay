{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "handjet-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/handjet/Handjet%5BELGR,ELSH,wght%5D.ttf?raw=true";
      name = "Handjet_ELGR,ELSH,wght_.ttf";
      sha256 = "9262749e8bb0b73ebcae0e20428689c3c59576eebeb6c4e1020300d2d41bdf4d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Handjet_ELGR-ELSH-wght_.ttf $out/share/fonts/truetype/Handjet_ELGR-ELSH-wght_.ttf
  '';

  meta = with lib; {
    description = "Handjet";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
