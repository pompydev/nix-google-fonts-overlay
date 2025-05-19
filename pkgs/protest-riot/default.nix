{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "protest-riot-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/protestriot/ProtestRiot-Regular.ttf?raw=true";
      name = "ProtestRiot-Regular.ttf";
      sha256 = "0e9f6679f106b5777bf609f6afbc1ee1233adaaa8b045cb5fbebfb1cedfbf732";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ProtestRiot-Regular.ttf $out/share/fonts/truetype/ProtestRiot-Regular.ttf
  '';

  meta = with lib; {
    description = "Protest Riot";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
