{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "flow-block-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/flowblock/FlowBlock-Regular.ttf?raw=true";
      name = "FlowBlock-Regular.ttf";
      sha256 = "41df2ad95d9ae2d3573e7e958186e04a852a44a568e5c2fc5fbd22e416b50acc";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 FlowBlock-Regular.ttf $out/share/fonts/truetype/FlowBlock-Regular.ttf
  '';

  meta = with lib; {
    description = "Flow Block";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
