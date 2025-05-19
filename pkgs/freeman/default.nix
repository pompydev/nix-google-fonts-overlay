{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "freeman-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/freeman/Freeman-Regular.ttf?raw=true";
      name = "Freeman-Regular.ttf";
      sha256 = "48fac93ede204981c621a1fb039bdfcbbdf7e646aa7a7f823d4191bcebe16f49";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Freeman-Regular.ttf $out/share/fonts/truetype/Freeman-Regular.ttf
  '';

  meta = with lib; {
    description = "Freeman";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
