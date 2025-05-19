{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "cherry-cream-soda-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/apache/cherrycreamsoda/CherryCreamSoda-Regular.ttf?raw=true";
      name = "CherryCreamSoda-Regular.ttf";
      sha256 = "158577b383ce9798384580bd41c35cd0fb4ed550a32fe4a2e41f4f2594337385";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 CherryCreamSoda-Regular.ttf $out/share/fonts/truetype/CherryCreamSoda-Regular.ttf
  '';

  meta = with lib; {
    description = "Cherry Cream Soda";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
