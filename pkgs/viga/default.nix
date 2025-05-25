{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "viga-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/viga/Viga-Regular.ttf?raw=true";
      name = "Viga-Regular.ttf";
      sha256 = "730ad2a38691ce19ee5aa9dd9ec84ae8737b2084b06eef13435a4facad9b063c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Viga-Regular.ttf $out/share/fonts/truetype/Viga-Regular.ttf
  '';

  meta = with lib; {
    description = "Viga";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
