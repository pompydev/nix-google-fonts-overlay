{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "iceberg-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/iceberg/Iceberg-Regular.ttf?raw=true";
      name = "Iceberg-Regular.ttf";
      sha256 = "dbbe0c4fceebe2e1c966362e9d647104c74796e52d494554eeabf4d6104fb2ff";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Iceberg-Regular.ttf $out/share/fonts/truetype/Iceberg-Regular.ttf
  '';

  meta = with lib; {
    description = "Iceberg";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
