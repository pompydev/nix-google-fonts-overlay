{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "pt-mono-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/ptmono/PTM55FT.ttf?raw=true";
      name = "PTM55FT.ttf";
      sha256 = "cbe732b3b8fd211fd986ebdfc9b870ddeca4faab0bb5425fc509b37f9b4ac804";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PTM55FT.ttf $out/share/fonts/truetype/PTM55FT.ttf
  '';

  meta = with lib; {
    description = "PT Mono";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
