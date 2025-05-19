{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "baloo-thambi-2-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/baloothambi2/BalooThambi2%5Bwght%5D.ttf?raw=true";
      name = "BalooThambi2_wght_.ttf";
      sha256 = "6739a11d3557b7426f0f43ce3a22ff6fbfee2d3be56ffb4df093d35d3460bf73";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BalooThambi2_wght_.ttf $out/share/fonts/truetype/BalooThambi2_wght_.ttf
  '';

  meta = with lib; {
    description = "Baloo Thambi 2";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
