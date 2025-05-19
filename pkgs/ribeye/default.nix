{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ribeye-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/ribeye/Ribeye-Regular.ttf?raw=true";
      name = "Ribeye-Regular.ttf";
      sha256 = "c384b009dba7b9c973402427716ccf2a57dc5e44b30cfda45fc0ecc5cf238bcb";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Ribeye-Regular.ttf $out/share/fonts/truetype/Ribeye-Regular.ttf
  '';

  meta = with lib; {
    description = "Ribeye";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
