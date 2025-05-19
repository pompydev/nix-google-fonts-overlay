{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "yeon-sung-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/yeonsung/YeonSung-Regular.ttf?raw=true";
      name = "YeonSung-Regular.ttf";
      sha256 = "49ac2a11009f5f58307d377911eb45d210cf4c1d379d9eca38fb4cdad5491ef6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 YeonSung-Regular.ttf $out/share/fonts/truetype/YeonSung-Regular.ttf
  '';

  meta = with lib; {
    description = "Yeon Sung";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
