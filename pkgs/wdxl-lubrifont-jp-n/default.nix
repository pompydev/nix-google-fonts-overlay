{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "wdxl-lubrifont-jp-n-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/wdxllubrifontjpn/WDXLLubrifontJPN-Regular.ttf?raw=true";
      name = "WDXLLubrifontJPN-Regular.ttf";
      sha256 = "f7a95e761a2d2c2ee6a90f8536e42ea9e50bae8840695f01704986e2bce34869";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 WDXLLubrifontJPN-Regular.ttf $out/share/fonts/truetype/WDXLLubrifontJPN-Regular.ttf
  '';

  meta = with lib; {
    description = "WDXL Lubrifont JP N";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
