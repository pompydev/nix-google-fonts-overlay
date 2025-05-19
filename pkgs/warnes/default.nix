{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "warnes-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/warnes/Warnes-Regular.ttf?raw=true";
      name = "Warnes-Regular.ttf";
      sha256 = "d3bd538498237de2f30420b45efe9b1a2d0671f66868ddf595284f797266ba32";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Warnes-Regular.ttf $out/share/fonts/truetype/Warnes-Regular.ttf
  '';

  meta = with lib; {
    description = "Warnes";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
