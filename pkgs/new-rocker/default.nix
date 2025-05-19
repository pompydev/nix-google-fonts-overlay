{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "new-rocker-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/newrocker/NewRocker-Regular.ttf?raw=true";
      name = "NewRocker-Regular.ttf";
      sha256 = "28a499ce5b8bcf0652f8b2e25135183eaddf0c3c8c3e251259b075c71d1ef14c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NewRocker-Regular.ttf $out/share/fonts/truetype/NewRocker-Regular.ttf
  '';

  meta = with lib; {
    description = "New Rocker";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
