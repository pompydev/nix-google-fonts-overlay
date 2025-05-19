{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "krona-one-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/kronaone/KronaOne-Regular.ttf?raw=true";
      name = "KronaOne-Regular.ttf";
      sha256 = "273463916f96a4707e697e3013d955cde8154b4e6d635a55132e7a12f276534c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 KronaOne-Regular.ttf $out/share/fonts/truetype/KronaOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Krona One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
