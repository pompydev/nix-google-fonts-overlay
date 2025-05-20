{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "big-shoulders-stencil-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/bigshouldersstencil/BigShouldersStencil%5Bopsz,wght%5D.ttf?raw=true";
      name = "BigShouldersStencil_opsz,wght_.ttf";
      sha256 = "758ec880296a8bdaf736a31fc57e90fa16673d8c357efc3c36bdb6582d625f0a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BigShouldersStencil_opsz-wght_.ttf $out/share/fonts/truetype/BigShouldersStencil_opsz-wght_.ttf
  '';

  meta = with lib; {
    description = "Big Shoulders Stencil";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
