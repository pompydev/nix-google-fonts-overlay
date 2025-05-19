{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "mea-culpa-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/meaculpa/MeaCulpa-Regular.ttf?raw=true";
      name = "MeaCulpa-Regular.ttf";
      sha256 = "c5a293151793820d25ff10844f1418170ae755fa61d0a126cefa1e9b82f21ce5";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 MeaCulpa-Regular.ttf $out/share/fonts/truetype/MeaCulpa-Regular.ttf
  '';

  meta = with lib; {
    description = "Mea Culpa";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
