{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "lustria-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/lustria/Lustria-Regular.ttf?raw=true";
      name = "Lustria-Regular.ttf";
      sha256 = "8b50753779d151674dcc74bdf9cdde1e788d8fb2b9ace8fb183a0def0f7361ce";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Lustria-Regular.ttf $out/share/fonts/truetype/Lustria-Regular.ttf
  '';

  meta = with lib; {
    description = "Lustria";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
