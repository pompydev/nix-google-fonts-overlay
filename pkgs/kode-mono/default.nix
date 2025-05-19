{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "kode-mono-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/kodemono/KodeMono%5Bwght%5D.ttf?raw=true";
      name = "KodeMono_wght_.ttf";
      sha256 = "5ce8baede4ef692ea485e630a9fbd485c847f74954df66db5de0564b6dd8c3db";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 KodeMono_wght_.ttf $out/share/fonts/truetype/KodeMono_wght_.ttf
  '';

  meta = with lib; {
    description = "Kode Mono";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
