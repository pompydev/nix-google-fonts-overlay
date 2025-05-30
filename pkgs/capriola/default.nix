{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "capriola-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/capriola/Capriola-Regular.ttf?raw=true";
      name = "Capriola-Regular.ttf";
      sha256 = "4a6e1a7b6b34852674ef0ffd2f7049a903e68b49d3533b6f651cad039df42288";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Capriola-Regular.ttf $out/share/fonts/truetype/Capriola-Regular.ttf
  '';

  meta = with lib; {
    description = "Capriola";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
