{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "baloo-2-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/baloo2/Baloo2%5Bwght%5D.ttf?raw=true";
      name = "Baloo2_wght_.ttf";
      sha256 = "d47a6852548059b1db49a1319d06d499d546c3fa2237cf9eee9c43c8abb025c2";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Baloo2_wght_.ttf $out/share/fonts/truetype/Baloo2_wght_.ttf
  '';

  meta = with lib; {
    description = "Baloo 2";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
