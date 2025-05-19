{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "balthazar-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/balthazar/Balthazar-Regular.ttf?raw=true";
      name = "Balthazar-Regular.ttf";
      sha256 = "b495856b693458a99a4fcfe420944b6034afe823eb159e8437b4e8929d5aceaa";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Balthazar-Regular.ttf $out/share/fonts/truetype/Balthazar-Regular.ttf
  '';

  meta = with lib; {
    description = "Balthazar";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
