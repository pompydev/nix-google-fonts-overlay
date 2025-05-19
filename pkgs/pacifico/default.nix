{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "pacifico-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/pacifico/Pacifico-Regular.ttf?raw=true";
      name = "Pacifico-Regular.ttf";
      sha256 = "5b6c0d5334a7bf77dea52b975c5a0c408878c0f7115ed5b6fb151f634b7bf701";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Pacifico-Regular.ttf $out/share/fonts/truetype/Pacifico-Regular.ttf
  '';

  meta = with lib; {
    description = "Pacifico";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
