{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "lemon-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/lemon/Lemon-Regular.ttf?raw=true";
      name = "Lemon-Regular.ttf";
      sha256 = "6a3973a9ea7c05e6041969d0a5e8f2b04db3b2ccd5e5bc98bc7ff52c0940ce2f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Lemon-Regular.ttf $out/share/fonts/truetype/Lemon-Regular.ttf
  '';

  meta = with lib; {
    description = "Lemon";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
