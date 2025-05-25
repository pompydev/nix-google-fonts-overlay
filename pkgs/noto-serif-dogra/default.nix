{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-dogra-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notoserifdogra/NotoSerifDogra-Regular.ttf?raw=true";
      name = "NotoSerifDogra-Regular.ttf";
      sha256 = "82c4680f67a8437f6e237adbc5da559751bb3fcd251e9b82c6d7bd9879896024";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSerifDogra-Regular.ttf $out/share/fonts/truetype/NotoSerifDogra-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Serif Dogra";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
