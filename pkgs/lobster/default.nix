{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "lobster-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/lobster/Lobster-Regular.ttf?raw=true";
      name = "Lobster-Regular.ttf";
      sha256 = "d6568e697fd50cedc0be04d8aae4127fe95add607e7bff954ca88604be80c205";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Lobster-Regular.ttf $out/share/fonts/truetype/Lobster-Regular.ttf
  '';

  meta = with lib; {
    description = "Lobster";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
