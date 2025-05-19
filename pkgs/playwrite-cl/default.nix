{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-cl-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/playwritecl/PlaywriteCL%5Bwght%5D.ttf?raw=true";
      name = "PlaywriteCL_wght_.ttf";
      sha256 = "da9752010e63b66c3a1084a87dbba27463582585cb09bad81843ab6718fa1969";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteCL_wght_.ttf $out/share/fonts/truetype/PlaywriteCL_wght_.ttf
  '';

  meta = with lib; {
    description = "Playwrite CL";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
