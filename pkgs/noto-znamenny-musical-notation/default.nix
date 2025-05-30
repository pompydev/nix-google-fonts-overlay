{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-znamenny-musical-notation-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notoznamennymusicalnotation/NotoZnamennyMusicalNotation-Regular.ttf?raw=true";
      name = "NotoZnamennyMusicalNotation-Regular.ttf";
      sha256 = "38b7bd32372d35f7601e8cc485c5b04d0a023c75ecebe9543a7916e3c0626c32";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoZnamennyMusicalNotation-Regular.ttf $out/share/fonts/truetype/NotoZnamennyMusicalNotation-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Znamenny Musical Notation";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
