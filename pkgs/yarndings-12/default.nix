{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "yarndings-12-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/yarndings12/Yarndings12-Regular.ttf?raw=true";
      name = "Yarndings12-Regular.ttf";
      sha256 = "f7774d76e873c3bafefc3feb334816a15d86684f151b5e85bea7eb98650a981d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Yarndings12-Regular.ttf $out/share/fonts/truetype/Yarndings12-Regular.ttf
  '';

  meta = with lib; {
    description = "Yarndings 12";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
