{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "mate-sc-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/matesc/MateSC-Regular.ttf?raw=true";
      name = "MateSC-Regular.ttf";
      sha256 = "7aa5db42e899619bf2ecac412fc5668a3ea5d5cdc0af05cf95656c10fdfb50a0";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 MateSC-Regular.ttf $out/share/fonts/truetype/MateSC-Regular.ttf
  '';

  meta = with lib; {
    description = "Mate SC";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
