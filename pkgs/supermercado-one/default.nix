{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "supermercado-one-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/supermercadoone/SupermercadoOne-Regular.ttf?raw=true";
      name = "SupermercadoOne-Regular.ttf";
      sha256 = "73e1f6c46e4f94949df8394a5dc207a5ae4c75b94d19b012c7b8eaa67dca3750";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SupermercadoOne-Regular.ttf $out/share/fonts/truetype/SupermercadoOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Supermercado One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
