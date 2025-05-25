{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bitcount-prop-single-ink-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/bitcountpropsingleink/BitcountPropSingleInk%5BCRSV,ELSH,ELXP,SZP1,SZP2,XPN1,XPN2,YPN1,YPN2,slnt,wght%5D.ttf?raw=true";
      name = "BitcountPropSingleInk_CRSV,ELSH,ELXP,SZP1,SZP2,XPN1,XPN2,YPN1,YPN2,slnt,wght_.ttf";
      sha256 = "851351c507429ec6ce00292fd50e3b62f75c8c7ead17bc4f2bae2a4131e0720e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BitcountPropSingleInk_CRSV-ELSH-ELXP-SZP1-SZP2-XPN1-XPN2-YPN1-YPN2-slnt-wght_.ttf $out/share/fonts/truetype/BitcountPropSingleInk_CRSV-ELSH-ELXP-SZP1-SZP2-XPN1-XPN2-YPN1-YPN2-slnt-wght_.ttf
  '';

  meta = with lib; {
    description = "Bitcount Prop Single Ink";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
