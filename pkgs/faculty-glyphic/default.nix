{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "faculty-glyphic-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/facultyglyphic/FacultyGlyphic-Regular.ttf?raw=true";
      name = "FacultyGlyphic-Regular.ttf";
      sha256 = "27010aebf4430da073b75b8877bc3d3e35bd24d2e4f9403d34418abe94c3d31f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 FacultyGlyphic-Regular.ttf $out/share/fonts/truetype/FacultyGlyphic-Regular.ttf
  '';

  meta = with lib; {
    description = "Faculty Glyphic";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
