{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "yarndings-20-charted-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/yarndings20charted/Yarndings20Charted-Regular.ttf?raw=true";
      name = "Yarndings20Charted-Regular.ttf";
      sha256 = "06130542e36f1cce66ae8b5b7c2585f6a478aadfa6caf1634dd39c3a4fc0590c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Yarndings20Charted-Regular.ttf $out/share/fonts/truetype/Yarndings20Charted-Regular.ttf
  '';

  meta = with lib; {
    description = "Yarndings 20 Charted";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
