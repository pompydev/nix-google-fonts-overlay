{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ramaraja-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/ramaraja/Ramaraja-Regular.ttf?raw=true";
      name = "Ramaraja-Regular.ttf";
      sha256 = "9540e2a6d611b0f7e0852d64212091cad7a8f0af2128cbf391ee668c5699148f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Ramaraja-Regular.ttf $out/share/fonts/truetype/Ramaraja-Regular.ttf
  '';

  meta = with lib; {
    description = "Ramaraja";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
