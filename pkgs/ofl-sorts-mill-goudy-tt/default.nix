{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ofl-sorts-mill-goudy-tt-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/oflsortsmillgoudytt/OFLGoudyStMTT.ttf?raw=true";
      name = "OFLGoudyStMTT.ttf";
      sha256 = "1f1687e57369887ee785be79138b2b98d36dc5f10641e936bbc91643bf67bb7a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/oflsortsmillgoudytt/OFLGoudyStMTT-Italic.ttf?raw=true";
      name = "OFLGoudyStMTT-Italic.ttf";
      sha256 = "7cb1647c646e79fb7f4295181fc176e5c5b248f1967ed4bb9f48e4a5c57c462b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 OFLGoudyStMTT.ttf $out/share/fonts/truetype/OFLGoudyStMTT.ttf
     install -Dm644 OFLGoudyStMTT-Italic.ttf $out/share/fonts/truetype/OFLGoudyStMTT-Italic.ttf
  '';

  meta = with lib; {
    description = "OFL Sorts Mill Goudy TT";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
