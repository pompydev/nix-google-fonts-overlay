{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "cute-font-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/cutefont/CuteFont-Regular.ttf?raw=true";
      name = "CuteFont-Regular.ttf";
      sha256 = "c403227fe6288a8c1423ca48e93fd7efc81e3b81053f7d17adcf659bd95fa4c3";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 CuteFont-Regular.ttf $out/share/fonts/truetype/CuteFont-Regular.ttf
  '';

  meta = with lib; {
    description = "Cute Font";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
