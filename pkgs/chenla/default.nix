{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "chenla-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/chenla/Chenla.ttf?raw=true";
      name = "Chenla.ttf";
      sha256 = "0174cda2c7718e129b9f2599cd7dd9265b01a63b9acf67f939882f0fddff29b7";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Chenla.ttf $out/share/fonts/truetype/Chenla.ttf
  '';

  meta = with lib; {
    description = "Chenla";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
