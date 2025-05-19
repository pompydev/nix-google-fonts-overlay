{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "dawning-of-a-new-day-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/dawningofanewday/DawningofaNewDay.ttf?raw=true";
      name = "DawningofaNewDay.ttf";
      sha256 = "2b2afa623dbb1926e3b026603287b4d15ee05778106e26a7b33ef94d4be29dcb";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 DawningofaNewDay.ttf $out/share/fonts/truetype/DawningofaNewDay.ttf
  '';

  meta = with lib; {
    description = "Dawning of a New Day";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
