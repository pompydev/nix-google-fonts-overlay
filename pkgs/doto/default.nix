{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "doto-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/doto/Doto%5BROND,wght%5D.ttf?raw=true";
      name = "Doto_ROND,wght_.ttf";
      sha256 = "6f4fe7d37853b91df3698daa84cde2dbe1c9695d88c986e6510134910337d426";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Doto_ROND-wght_.ttf $out/share/fonts/truetype/Doto_ROND-wght_.ttf
  '';

  meta = with lib; {
    description = "Doto";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
