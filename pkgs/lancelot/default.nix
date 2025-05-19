{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "lancelot-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/lancelot/Lancelot-Regular.ttf?raw=true";
      name = "Lancelot-Regular.ttf";
      sha256 = "beca925079dfc167416fdafe9536136a14f66dc5cb06d94949f6e95fba49674c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Lancelot-Regular.ttf $out/share/fonts/truetype/Lancelot-Regular.ttf
  '';

  meta = with lib; {
    description = "Lancelot";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
