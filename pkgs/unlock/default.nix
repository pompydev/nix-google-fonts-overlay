{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "unlock-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/unlock/Unlock-Regular.ttf?raw=true";
      name = "Unlock-Regular.ttf";
      sha256 = "916edbbc325dd8abc630d688c88b4501df9494183295662f017ebe2ace843519";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Unlock-Regular.ttf $out/share/fonts/truetype/Unlock-Regular.ttf
  '';

  meta = with lib; {
    description = "Unlock";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
