{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "dokdo-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/dokdo/Dokdo-Regular.ttf?raw=true";
      name = "Dokdo-Regular.ttf";
      sha256 = "5b3a3d8d28af31fa9adec3fc5da81a88b52e1ff39ed3930c1db787aa4e79c36d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Dokdo-Regular.ttf $out/share/fonts/truetype/Dokdo-Regular.ttf
  '';

  meta = with lib; {
    description = "Dokdo";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
