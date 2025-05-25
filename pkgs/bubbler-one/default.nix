{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bubbler-one-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/bubblerone/BubblerOne-Regular.ttf?raw=true";
      name = "BubblerOne-Regular.ttf";
      sha256 = "a6dfd3cba4ffb33a603317be430f2cb8ff91ce04e529af79ae7fdef6dd2e1782";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BubblerOne-Regular.ttf $out/share/fonts/truetype/BubblerOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Bubbler One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
