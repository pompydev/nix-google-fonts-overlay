{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "vina-sans-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/vinasans/VinaSans-Regular.ttf?raw=true";
      name = "VinaSans-Regular.ttf";
      sha256 = "aaab4634a39d8a9f51d97844822ae4cba4a64e0d24b26e88f7b5d401e954fe13";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 VinaSans-Regular.ttf $out/share/fonts/truetype/VinaSans-Regular.ttf
  '';

  meta = with lib; {
    description = "Vina Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
