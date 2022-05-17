{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "flow-block-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4eafa089518e614a30fa2e783879f45cec0da803/ofl/flowblock/FlowBlock-Regular.ttf?raw=true";
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
