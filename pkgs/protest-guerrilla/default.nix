{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "protest-guerrilla-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/protestguerrilla/ProtestGuerrilla-Regular.ttf?raw=true";
      name = "ProtestGuerrilla-Regular.ttf";
      sha256 = "f163ab212c3310173fc3807a7ec309b188c3f9a845b543af8c80d6fceb8b1df6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ProtestGuerrilla-Regular.ttf $out/share/fonts/truetype/ProtestGuerrilla-Regular.ttf
  '';

  meta = with lib; {
    description = "Protest Guerrilla";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
