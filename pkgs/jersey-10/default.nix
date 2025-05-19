{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "jersey-10-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/jersey10/Jersey10-Regular.ttf?raw=true";
      name = "Jersey10-Regular.ttf";
      sha256 = "db9cbd091617048a145d249daa2b815fe7083be6ab66ac26626e21a4e01c3e82";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Jersey10-Regular.ttf $out/share/fonts/truetype/Jersey10-Regular.ttf
  '';

  meta = with lib; {
    description = "Jersey 10";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
