{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "schoolbell-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/apache/schoolbell/Schoolbell-Regular.ttf?raw=true";
      name = "Schoolbell-Regular.ttf";
      sha256 = "00ff6655a5eb1eb70d32f2b7351d1bcf3f45f3f9ca40fd5c0d25da79f7f82a50";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Schoolbell-Regular.ttf $out/share/fonts/truetype/Schoolbell-Regular.ttf
  '';

  meta = with lib; {
    description = "Schoolbell";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
