{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "antic-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/antic/Antic-Regular.ttf?raw=true";
      name = "Antic-Regular.ttf";
      sha256 = "c5452292fc4356733af7b2d75d3a22ce4f782a519fce1ae9229947f1a5e39c89";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Antic-Regular.ttf $out/share/fonts/truetype/Antic-Regular.ttf
  '';

  meta = with lib; {
    description = "Antic";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
