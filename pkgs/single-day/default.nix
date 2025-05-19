{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "single-day-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/singleday/SingleDay-Regular.ttf?raw=true";
      name = "SingleDay-Regular.ttf";
      sha256 = "716ff67a4b0675b35c26d60a4bb83173f7d153ab754474ed36c3369593ca1ca8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SingleDay-Regular.ttf $out/share/fonts/truetype/SingleDay-Regular.ttf
  '';

  meta = with lib; {
    description = "Single Day";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
