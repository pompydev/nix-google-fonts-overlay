{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "michroma-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/michroma/Michroma-Regular.ttf?raw=true";
      name = "Michroma-Regular.ttf";
      sha256 = "b62301163788bc5b7f8fcac0b74b184e34e1827e577b499ecb724da065098f87";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Michroma-Regular.ttf $out/share/fonts/truetype/Michroma-Regular.ttf
  '';

  meta = with lib; {
    description = "Michroma";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
