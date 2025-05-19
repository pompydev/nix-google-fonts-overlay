{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "tac-one-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/tacone/TacOne-Regular.ttf?raw=true";
      name = "TacOne-Regular.ttf";
      sha256 = "0b52bc2a0d4bb3ba187d1da157d18e50fafa7a3158563293445f809c3c515d77";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 TacOne-Regular.ttf $out/share/fonts/truetype/TacOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Tac One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
