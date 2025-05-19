{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "wdxl-lubrifont-sc-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/wdxllubrifontsc/WDXLLubrifontSC-Regular.ttf?raw=true";
      name = "WDXLLubrifontSC-Regular.ttf";
      sha256 = "0134ed261d56aab8fa1860df677858c5d0d3ca899b2aa5430581c458a752e914";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 WDXLLubrifontSC-Regular.ttf $out/share/fonts/truetype/WDXLLubrifontSC-Regular.ttf
  '';

  meta = with lib; {
    description = "WDXL Lubrifont SC";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
