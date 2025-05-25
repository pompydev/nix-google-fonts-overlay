{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "lacquer-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/lacquer/Lacquer-Regular.ttf?raw=true";
      name = "Lacquer-Regular.ttf";
      sha256 = "140c21f71907a16952926ee354c81081092c90d599c89fe8b4557baeaebbbe83";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Lacquer-Regular.ttf $out/share/fonts/truetype/Lacquer-Regular.ttf
  '';

  meta = with lib; {
    description = "Lacquer";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
