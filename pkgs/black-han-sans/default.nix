{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "black-han-sans-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/blackhansans/BlackHanSans-Regular.ttf?raw=true";
      name = "BlackHanSans-Regular.ttf";
      sha256 = "31960809284026681774a8e52dc19ebcad26cf69b0ad9d560f288296fbb52739";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BlackHanSans-Regular.ttf $out/share/fonts/truetype/BlackHanSans-Regular.ttf
  '';

  meta = with lib; {
    description = "Black Han Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
