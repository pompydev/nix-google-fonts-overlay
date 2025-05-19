{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "geist-mono-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/geistmono/GeistMono%5Bwght%5D.ttf?raw=true";
      name = "GeistMono_wght_.ttf";
      sha256 = "2386ddac2c72b6e0c126561e91486b7284412f303d8d9513da9ffec789e63338";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 GeistMono_wght_.ttf $out/share/fonts/truetype/GeistMono_wght_.ttf
  '';

  meta = with lib; {
    description = "Geist Mono";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
