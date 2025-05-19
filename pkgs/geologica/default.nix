{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "geologica-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/geologica/Geologica%5BCRSV,SHRP,slnt,wght%5D.ttf?raw=true";
      name = "Geologica_CRSV,SHRP,slnt,wght_.ttf";
      sha256 = "9124d9e88ac6c11d761f35241713a51d68e2c4ebedce0edaca834717a00959ec";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Geologica_CRSV,SHRP,slnt,wght_.ttf $out/share/fonts/truetype/Geologica_CRSV,SHRP,slnt,wght_.ttf
  '';

  meta = with lib; {
    description = "Geologica";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
