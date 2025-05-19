{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "mervale-script-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/mervalescript/MervaleScript-Regular.ttf?raw=true";
      name = "MervaleScript-Regular.ttf";
      sha256 = "52522c4965b84bf5e56015bf919b165b7eedbaedb08d7d0d7477c38141c953d6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 MervaleScript-Regular.ttf $out/share/fonts/truetype/MervaleScript-Regular.ttf
  '';

  meta = with lib; {
    description = "Mervale Script";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
