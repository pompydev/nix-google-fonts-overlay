{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-mayan-numerals-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosansmayannumerals/NotoSansMayanNumerals-Regular.ttf?raw=true";
      name = "NotoSansMayanNumerals-Regular.ttf";
      sha256 = "b073279ae1eabfbe8bd4232f5f83fdaeb439267f5580a7849ed9c4a04cf35d34";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansMayanNumerals-Regular.ttf $out/share/fonts/truetype/NotoSansMayanNumerals-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Mayan Numerals";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
