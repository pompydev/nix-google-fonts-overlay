{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-mende-kikakui-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosansmendekikakui/NotoSansMendeKikakui-Regular.ttf?raw=true";
      name = "NotoSansMendeKikakui-Regular.ttf";
      sha256 = "1f0d4e5957f2d74ffd2ef4850b512e512066c58365308e433985c3842f2d779f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansMendeKikakui-Regular.ttf $out/share/fonts/truetype/NotoSansMendeKikakui-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Mende Kikakui";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
