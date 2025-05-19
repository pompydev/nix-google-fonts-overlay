{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "calistoga-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/calistoga/Calistoga-Regular.ttf?raw=true";
      name = "Calistoga-Regular.ttf";
      sha256 = "85a5accb2453368357d432fd0edf4701545cac7551946711c06085677fd1399f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Calistoga-Regular.ttf $out/share/fonts/truetype/Calistoga-Regular.ttf
  '';

  meta = with lib; {
    description = "Calistoga";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
