{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bruno-ace-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/brunoace/BrunoAce-Regular.ttf?raw=true";
      name = "BrunoAce-Regular.ttf";
      sha256 = "2ebb34cae30afcb6859757b8c0cc49c49203781216e4446e07a77046c633cc2b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BrunoAce-Regular.ttf $out/share/fonts/truetype/BrunoAce-Regular.ttf
  '';

  meta = with lib; {
    description = "Bruno Ace";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
