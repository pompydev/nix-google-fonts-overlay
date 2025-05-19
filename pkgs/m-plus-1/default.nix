{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "m-plus-1-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/mplus1/MPLUS1%5Bwght%5D.ttf?raw=true";
      name = "MPLUS1_wght_.ttf";
      sha256 = "20785932102b0e9809422b2f31cc6b55183d0285c7af63d5373101208267bdc6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 MPLUS1_wght_.ttf $out/share/fonts/truetype/MPLUS1_wght_.ttf
  '';

  meta = with lib; {
    description = "M PLUS 1";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
