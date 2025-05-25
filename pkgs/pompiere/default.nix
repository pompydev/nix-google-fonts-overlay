{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "pompiere-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/pompiere/Pompiere-Regular.ttf?raw=true";
      name = "Pompiere-Regular.ttf";
      sha256 = "11610bde374970a6ca01136fdbea820f795fceae8c399c664e69f1277c1bc523";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Pompiere-Regular.ttf $out/share/fonts/truetype/Pompiere-Regular.ttf
  '';

  meta = with lib; {
    description = "Pompiere";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
