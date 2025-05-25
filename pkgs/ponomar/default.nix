{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ponomar-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/ponomar/Ponomar-Regular.ttf?raw=true";
      name = "Ponomar-Regular.ttf";
      sha256 = "c3f7aa32d64fa80e3b53357f057ca31ced4249fae3ba5fcab8cddb39b64c68a0";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Ponomar-Regular.ttf $out/share/fonts/truetype/Ponomar-Regular.ttf
  '';

  meta = with lib; {
    description = "Ponomar";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
