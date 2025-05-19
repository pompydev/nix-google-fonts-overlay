{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "erica-one-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/ericaone/EricaOne-Regular.ttf?raw=true";
      name = "EricaOne-Regular.ttf";
      sha256 = "4b135f75996959d65d425b7175f0944243fabe8e9d62238555ad9c9b19a17d93";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 EricaOne-Regular.ttf $out/share/fonts/truetype/EricaOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Erica One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
