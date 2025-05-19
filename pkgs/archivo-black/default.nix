{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "archivo-black-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/archivoblack/ArchivoBlack-Regular.ttf?raw=true";
      name = "ArchivoBlack-Regular.ttf";
      sha256 = "dd9a89a019b4849f66ab75455fe7bdf931311042cbb0f0f97acc061539703180";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ArchivoBlack-Regular.ttf $out/share/fonts/truetype/ArchivoBlack-Regular.ttf
  '';

  meta = with lib; {
    description = "Archivo Black";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
