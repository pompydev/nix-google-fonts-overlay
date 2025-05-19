{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "wdxl-lubrifont-tc-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/wdxllubrifonttc/WDXLLubrifontTC-Regular.ttf?raw=true";
      name = "WDXLLubrifontTC-Regular.ttf";
      sha256 = "acae31588d34ba66a51a6271209bdcbb6105962f0f77a74729e69e3938f96775";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 WDXLLubrifontTC-Regular.ttf $out/share/fonts/truetype/WDXLLubrifontTC-Regular.ttf
  '';

  meta = with lib; {
    description = "WDXL Lubrifont TC";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
