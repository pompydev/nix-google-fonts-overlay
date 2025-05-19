{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "shanti-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/shanti/Shanti-Regular.ttf?raw=true";
      name = "Shanti-Regular.ttf";
      sha256 = "cc7320c8c4579293f4389ac391b4189c59d8276c3ac1f3b902bf0b0f0e2e9278";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Shanti-Regular.ttf $out/share/fonts/truetype/Shanti-Regular.ttf
  '';

  meta = with lib; {
    description = "Shanti";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
