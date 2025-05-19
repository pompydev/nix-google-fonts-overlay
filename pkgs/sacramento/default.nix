{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "sacramento-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/sacramento/Sacramento-Regular.ttf?raw=true";
      name = "Sacramento-Regular.ttf";
      sha256 = "9341fda10adbfeb7efc94302b34507a3e227d7e7f5c432df3f5ac8753ff73d24";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Sacramento-Regular.ttf $out/share/fonts/truetype/Sacramento-Regular.ttf
  '';

  meta = with lib; {
    description = "Sacramento";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
