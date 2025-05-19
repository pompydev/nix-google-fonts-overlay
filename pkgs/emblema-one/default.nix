{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "emblema-one-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/emblemaone/EmblemaOne-Regular.ttf?raw=true";
      name = "EmblemaOne-Regular.ttf";
      sha256 = "068ab584fb9868c299776adb871cf693b21123ccfb6ed5fab98ff861d1d42bee";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 EmblemaOne-Regular.ttf $out/share/fonts/truetype/EmblemaOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Emblema One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
