{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "handjet-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/handjet/Handjet%5BELGR,ELSH,wght%5D.ttf?raw=true";
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
