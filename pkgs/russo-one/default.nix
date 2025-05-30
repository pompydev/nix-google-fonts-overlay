{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "russo-one-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/russoone/RussoOne-Regular.ttf?raw=true";
      name = "RussoOne-Regular.ttf";
      sha256 = "bc0abcc660bd8b7ad3000ecb2898a27c58a29a50f7ec81652fa12e75148d09df";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 RussoOne-Regular.ttf $out/share/fonts/truetype/RussoOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Russo One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
