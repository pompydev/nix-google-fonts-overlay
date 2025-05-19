{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "passions-conflict-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/passionsconflict/PassionsConflict-Regular.ttf?raw=true";
      name = "PassionsConflict-Regular.ttf";
      sha256 = "6fa9080c8a5577803c3e6073e92a54758930e8cc31112f6500901be34d5fc55a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PassionsConflict-Regular.ttf $out/share/fonts/truetype/PassionsConflict-Regular.ttf
  '';

  meta = with lib; {
    description = "Passions Conflict";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
