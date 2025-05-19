{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "black-ops-one-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/blackopsone/BlackOpsOne-Regular.ttf?raw=true";
      name = "BlackOpsOne-Regular.ttf";
      sha256 = "282a825b5f294377387e3969f765408157dbea8da0f5d0aae68c6bc704b145b3";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BlackOpsOne-Regular.ttf $out/share/fonts/truetype/BlackOpsOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Black Ops One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
