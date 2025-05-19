{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "fauna-one-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/faunaone/FaunaOne-Regular.ttf?raw=true";
      name = "FaunaOne-Regular.ttf";
      sha256 = "3c636067331e86fbf349924f3c1964155b99072a390caaffe60ce6c0866363fe";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 FaunaOne-Regular.ttf $out/share/fonts/truetype/FaunaOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Fauna One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
