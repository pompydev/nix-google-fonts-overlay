{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "prosto-one-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/prostoone/ProstoOne-Regular.ttf?raw=true";
      name = "ProstoOne-Regular.ttf";
      sha256 = "745974a4c404cc1fd646d4134940ed359657d6c28634b544f9cbc0f830791ea6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ProstoOne-Regular.ttf $out/share/fonts/truetype/ProstoOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Prosto One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
