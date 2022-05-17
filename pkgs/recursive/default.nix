{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "recursive-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90cefea260c147a08c59c8c5cbe4fa28c40ae4f9/ofl/recursive/Recursive%5BCASL,CRSV,MONO,slnt,wght%5D.ttf?raw=true";
      name = "Recursive_CASL,CRSV,MONO,slnt,wght_.ttf";
      sha256 = "b91b4e4d33f1b8bb50ec20e819224ced5e30ba77b306cae6c63d39c278c8952d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Recursive_CASL,CRSV,MONO,slnt,wght_.ttf $out/share/fonts/truetype/Recursive_CASL,CRSV,MONO,slnt,wght_.ttf
  '';

  meta = with lib; {
    description = "Recursive";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
