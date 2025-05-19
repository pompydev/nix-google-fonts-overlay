{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "calligraffitti-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/apache/calligraffitti/Calligraffitti-Regular.ttf?raw=true";
      name = "Calligraffitti-Regular.ttf";
      sha256 = "d6c0464e8c53dd8fefca7ee3af1aa2c20c6cf6a40e4537d2cd4353bff3a168d0";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Calligraffitti-Regular.ttf $out/share/fonts/truetype/Calligraffitti-Regular.ttf
  '';

  meta = with lib; {
    description = "Calligraffitti";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
