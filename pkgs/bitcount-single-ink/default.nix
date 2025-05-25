{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bitcount-single-ink-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/bitcountsingleink/BitcountSingleInk%5BCRSV,ELSH,ELXP,SZP1,SZP2,XPN1,XPN2,YPN1,YPN2,slnt,wght%5D.ttf?raw=true";
      name = "BitcountSingleInk_CRSV,ELSH,ELXP,SZP1,SZP2,XPN1,XPN2,YPN1,YPN2,slnt,wght_.ttf";
      sha256 = "f21bfe8087152875b75bded0b13c6f7959c005c224a43b74ad05008bb149777c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BitcountSingleInk_CRSV-ELSH-ELXP-SZP1-SZP2-XPN1-XPN2-YPN1-YPN2-slnt-wght_.ttf $out/share/fonts/truetype/BitcountSingleInk_CRSV-ELSH-ELXP-SZP1-SZP2-XPN1-XPN2-YPN1-YPN2-slnt-wght_.ttf
  '';

  meta = with lib; {
    description = "Bitcount Single Ink";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
