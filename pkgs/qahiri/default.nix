{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "qahiri-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/qahiri/Qahiri-Regular.ttf?raw=true";
      name = "Qahiri-Regular.ttf";
      sha256 = "68e31a245a8613d8b49d55f7ceffdd88b26f2abace2a9dd094a076d78f53a203";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Qahiri-Regular.ttf $out/share/fonts/truetype/Qahiri-Regular.ttf
  '';

  meta = with lib; {
    description = "Qahiri";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
