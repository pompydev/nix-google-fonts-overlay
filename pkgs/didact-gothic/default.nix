{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "didact-gothic-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/didactgothic/DidactGothic-Regular.ttf?raw=true";
      name = "DidactGothic-Regular.ttf";
      sha256 = "b98f9e091b6337a86f4e0f69c94c31905e1e287782853f472e176b4e28d3f81f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 DidactGothic-Regular.ttf $out/share/fonts/truetype/DidactGothic-Regular.ttf
  '';

  meta = with lib; {
    description = "Didact Gothic";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
