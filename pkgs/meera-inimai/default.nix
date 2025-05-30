{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "meera-inimai-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/meerainimai/MeeraInimai-Regular.ttf?raw=true";
      name = "MeeraInimai-Regular.ttf";
      sha256 = "3dffa9501ac790b5e1c3ebecdba4f2c90a617a7d3131fad129893929bc56708e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 MeeraInimai-Regular.ttf $out/share/fonts/truetype/MeeraInimai-Regular.ttf
  '';

  meta = with lib; {
    description = "Meera Inimai";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
