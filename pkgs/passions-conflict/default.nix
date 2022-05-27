{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "passions-conflict-${version}";
  version = "2022-05-23-231859";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f937a9ba8f4f35aea43c9b5e09583762e196aa04/ofl/passionsconflict/PassionsConflict-Regular.ttf?raw=true";
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
