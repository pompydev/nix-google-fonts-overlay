{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "petit-formal-script-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/petitformalscript/PetitFormalScript-Regular.ttf?raw=true";
      name = "PetitFormalScript-Regular.ttf";
      sha256 = "9b80a05170bac7f372b7e00bc762fe14bafd4abdeb013747b189f66525cffe89";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PetitFormalScript-Regular.ttf $out/share/fonts/truetype/PetitFormalScript-Regular.ttf
  '';

  meta = with lib; {
    description = "Petit Formal Script";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
