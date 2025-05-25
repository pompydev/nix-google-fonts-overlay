{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-palmyrene-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosanspalmyrene/NotoSansPalmyrene-Regular.ttf?raw=true";
      name = "NotoSansPalmyrene-Regular.ttf";
      sha256 = "d9cb8aeef761d8f0639bdb182f03048435473f623f7567c9b6477fe320cd8404";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansPalmyrene-Regular.ttf $out/share/fonts/truetype/NotoSansPalmyrene-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Palmyrene";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
