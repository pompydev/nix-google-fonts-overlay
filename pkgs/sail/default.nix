{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "sail-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/sail/Sail-Regular.ttf?raw=true";
      name = "Sail-Regular.ttf";
      sha256 = "0ec9a9e84f5570258d319a26bce92adadc4998ceacc4d95b63687c9da4164f65";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Sail-Regular.ttf $out/share/fonts/truetype/Sail-Regular.ttf
  '';

  meta = with lib; {
    description = "Sail";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
