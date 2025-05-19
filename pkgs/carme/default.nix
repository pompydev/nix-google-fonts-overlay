{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "carme-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/carme/Carme-Regular.ttf?raw=true";
      name = "Carme-Regular.ttf";
      sha256 = "2be32ebe8f62944b1df0f1bf0c76957bda369567b99454d749e51192a393db90";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Carme-Regular.ttf $out/share/fonts/truetype/Carme-Regular.ttf
  '';

  meta = with lib; {
    description = "Carme";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
