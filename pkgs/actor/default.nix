{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "actor-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/actor/Actor-Regular.ttf?raw=true";
      name = "Actor-Regular.ttf";
      sha256 = "a7cf62975a5ecaa8a3be2e2913ffb4a335831315478b93bec722ad982308ea38";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Actor-Regular.ttf $out/share/fonts/truetype/Actor-Regular.ttf
  '';

  meta = with lib; {
    description = "Actor";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
