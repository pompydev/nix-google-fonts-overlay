{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "chango-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/chango/Chango-Regular.ttf?raw=true";
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
