{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "cambo-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/cambo/Cambo-Regular.ttf?raw=true";
      name = "Cambo-Regular.ttf";
      sha256 = "526c80a8d006783e899537314972ac43449b520f53b96befc17c47175e9b2e2a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Cambo-Regular.ttf $out/share/fonts/truetype/Cambo-Regular.ttf
  '';

  meta = with lib; {
    description = "Cambo";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
