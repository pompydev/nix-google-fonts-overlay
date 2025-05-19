{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "kablammo-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/kablammo/Kablammo%5BMORF%5D.ttf?raw=true";
      name = "Kablammo_MORF_.ttf";
      sha256 = "900c8c183efc8d913da30dceb9e4e9886888bbd48847455343f12ce85a334925";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Kablammo_MORF_.ttf $out/share/fonts/truetype/Kablammo_MORF_.ttf
  '';

  meta = with lib; {
    description = "Kablammo";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
