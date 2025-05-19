{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "secular-one-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/secularone/SecularOne-Regular.ttf?raw=true";
      name = "SecularOne-Regular.ttf";
      sha256 = "2f45092a521db5042887941edfef73178ed7c5ba7fdfc5b6f581d44aab7b0234";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SecularOne-Regular.ttf $out/share/fonts/truetype/SecularOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Secular One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
