{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "herr-von-muellerhoff-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/herrvonmuellerhoff/HerrVonMuellerhoff-Regular.ttf?raw=true";
      name = "HerrVonMuellerhoff-Regular.ttf";
      sha256 = "ba8ac10807a79462b7c8265b2eebb8419e5017fdc1a5828b1a071d9e8478772e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 HerrVonMuellerhoff-Regular.ttf $out/share/fonts/truetype/HerrVonMuellerhoff-Regular.ttf
  '';

  meta = with lib; {
    description = "Herr Von Muellerhoff";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
