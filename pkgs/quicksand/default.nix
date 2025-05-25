{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "quicksand-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/quicksand/Quicksand%5Bwght%5D.ttf?raw=true";
      name = "Quicksand_wght_.ttf";
      sha256 = "39c9b64223561f56aaff6062a6f04063c4fc86809ad6768722c06614d977e1cc";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Quicksand_wght_.ttf $out/share/fonts/truetype/Quicksand_wght_.ttf
  '';

  meta = with lib; {
    description = "Quicksand";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
