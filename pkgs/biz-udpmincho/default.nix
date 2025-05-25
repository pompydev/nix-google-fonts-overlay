{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "biz-udpmincho-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/bizudpmincho/BIZUDPMincho-Regular.ttf?raw=true";
      name = "BIZUDPMincho-Regular.ttf";
      sha256 = "dbcea04578ac1e9d3484525e870ce491bd04361768f4d2ba4b827d96e20f891d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/bizudpmincho/BIZUDPMincho-Bold.ttf?raw=true";
      name = "BIZUDPMincho-Bold.ttf";
      sha256 = "99618e39b881597efc03d58706bd194757c968c1bf7a7017a893efead6b1b260";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BIZUDPMincho-Regular.ttf $out/share/fonts/truetype/BIZUDPMincho-Regular.ttf
     install -Dm644 BIZUDPMincho-Bold.ttf $out/share/fonts/truetype/BIZUDPMincho-Bold.ttf
  '';

  meta = with lib; {
    description = "BIZ UDPMincho";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
