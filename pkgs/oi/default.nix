{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "oi-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/0750dc7c2e46ca92aa88a536264cb7e82484b13e/ofl/oi/Oi-Regular.ttf?raw=true";
      name = "Oi-Regular.ttf";
      sha256 = "fcf5ed9604e4c992254ef1f3d775316ab98196141707d3a6e25593b5bb366871";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Oi-Regular.ttf $out/share/fonts/truetype/Oi-Regular.ttf
  '';

  meta = with lib; {
    description = "Oi";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
