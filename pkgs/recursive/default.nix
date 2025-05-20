{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "recursive-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/recursive/Recursive%5BCASL,CRSV,MONO,slnt,wght%5D.ttf?raw=true";
      name = "Recursive_CASL,CRSV,MONO,slnt,wght_.ttf";
      sha256 = "653221ca467f4732fe6856ac493f6c409e9f56a7674abe36b2364acc89796f7c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Recursive_CASL-CRSV-MONO-slnt-wght_.ttf $out/share/fonts/truetype/Recursive_CASL-CRSV-MONO-slnt-wght_.ttf
  '';

  meta = with lib; {
    description = "Recursive";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
