{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "rubik-doodle-triangles-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/rubikdoodletriangles/RubikDoodleTriangles-Regular.ttf?raw=true";
      name = "RubikDoodleTriangles-Regular.ttf";
      sha256 = "096790639e1a53a23efa86e4c0ed2083037a8bf42521cfd07bf09cbf163d89be";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 RubikDoodleTriangles-Regular.ttf $out/share/fonts/truetype/RubikDoodleTriangles-Regular.ttf
  '';

  meta = with lib; {
    description = "Rubik Doodle Triangles";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
