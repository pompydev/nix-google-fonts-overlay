{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "east-sea-dokdo-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/eastseadokdo/EastSeaDokdo-Regular.ttf?raw=true";
      name = "EastSeaDokdo-Regular.ttf";
      sha256 = "8cebb39d375134fdbcedef9bf4ec4f6c3f02c39ed0aacd6e83f7a0f435e593b2";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 EastSeaDokdo-Regular.ttf $out/share/fonts/truetype/EastSeaDokdo-Regular.ttf
  '';

  meta = with lib; {
    description = "East Sea Dokdo";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
