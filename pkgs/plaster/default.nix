{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "plaster-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/plaster/Plaster-Regular.ttf?raw=true";
      name = "Plaster-Regular.ttf";
      sha256 = "f8b2d7d1d56abd4f20ae962b9f0559e9072a0926b5963d9eed040929ca07dc2d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Plaster-Regular.ttf $out/share/fonts/truetype/Plaster-Regular.ttf
  '';

  meta = with lib; {
    description = "Plaster";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
