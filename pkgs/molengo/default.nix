{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "molengo-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/molengo/Molengo-Regular.ttf?raw=true";
      name = "Molengo-Regular.ttf";
      sha256 = "179b2472bbc83c90ffe3a64e31e7ce6915d22173ee5073cc4e786e9fc7792d76";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Molengo-Regular.ttf $out/share/fonts/truetype/Molengo-Regular.ttf
  '';

  meta = with lib; {
    description = "Molengo";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
