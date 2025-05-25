{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "uchen-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/uchen/Uchen-Regular.ttf?raw=true";
      name = "Uchen-Regular.ttf";
      sha256 = "d466b41c9d11beea843ea16b13de220da2026836b88f3b7d30665215fc0c5d2f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Uchen-Regular.ttf $out/share/fonts/truetype/Uchen-Regular.ttf
  '';

  meta = with lib; {
    description = "Uchen";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
