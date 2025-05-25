{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "cutive-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/cutive/Cutive-Regular.ttf?raw=true";
      name = "Cutive-Regular.ttf";
      sha256 = "8f0eb3280328c0051bbe725ce9d68c9117484b769cf68dbacec4343ae92ee031";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Cutive-Regular.ttf $out/share/fonts/truetype/Cutive-Regular.ttf
  '';

  meta = with lib; {
    description = "Cutive";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
