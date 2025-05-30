{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "unifrakturmaguntia-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/unifrakturmaguntia/UnifrakturMaguntia-Book.ttf?raw=true";
      name = "UnifrakturMaguntia-Book.ttf";
      sha256 = "d64afc0547059dd2e4a78da48bda0aba0a9901be58c7f8c201a8b2b6b4492cc8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 UnifrakturMaguntia-Book.ttf $out/share/fonts/truetype/UnifrakturMaguntia-Book.ttf
  '';

  meta = with lib; {
    description = "UnifrakturMaguntia";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
