{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bitcount-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/bitcount/Bitcount%5BCRSV,ELSH,ELXP,slnt,wght%5D.ttf?raw=true";
      name = "Bitcount_CRSV,ELSH,ELXP,slnt,wght_.ttf";
      sha256 = "c7931919e67faa0e9cea2118f47d8f96383c580cc5cb6a3cef9aa1233ba3923e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Bitcount_CRSV-ELSH-ELXP-slnt-wght_.ttf $out/share/fonts/truetype/Bitcount_CRSV-ELSH-ELXP-slnt-wght_.ttf
  '';

  meta = with lib; {
    description = "Bitcount";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
