{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "kurale-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/kurale/Kurale-Regular.ttf?raw=true";
      name = "Kurale-Regular.ttf";
      sha256 = "d38f95758535f086e6e03d3b1519fd7e718c4a0baccdab3e1df4f78daff6f6d6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Kurale-Regular.ttf $out/share/fonts/truetype/Kurale-Regular.ttf
  '';

  meta = with lib; {
    description = "Kurale";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
