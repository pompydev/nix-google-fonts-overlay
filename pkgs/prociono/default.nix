{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "prociono-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/prociono/Prociono-Regular.ttf?raw=true";
      name = "Prociono-Regular.ttf";
      sha256 = "cfc641117fe748d9958d9891702692da61bf86917de5039a0b31d30f78ce427a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Prociono-Regular.ttf $out/share/fonts/truetype/Prociono-Regular.ttf
  '';

  meta = with lib; {
    description = "Prociono";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
