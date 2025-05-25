{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "recursive-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/recursive/Recursive%5BCASL,CRSV,MONO,slnt,wght%5D.ttf?raw=true";
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
