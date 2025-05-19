{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "average-sans-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/averagesans/AverageSans-Regular.ttf?raw=true";
      name = "AverageSans-Regular.ttf";
      sha256 = "f978bb0eb5ad93b02f3a8e4ef0ed525a1192b4076e8a8d0bb37b2546a297762e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AverageSans-Regular.ttf $out/share/fonts/truetype/AverageSans-Regular.ttf
  '';

  meta = with lib; {
    description = "Average Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
