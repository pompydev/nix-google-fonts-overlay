{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "chango-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/chango/Chango-Regular.ttf?raw=true";
      name = "Chango-Regular.ttf";
      sha256 = "3e566f4b881f24198fe1b6525aae970f9200078136e3416abc7ba0272d2f80d9";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Chango-Regular.ttf $out/share/fonts/truetype/Chango-Regular.ttf
  '';

  meta = with lib; {
    description = "Chango";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
