{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-brahmi-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosansbrahmi/NotoSansBrahmi-Regular.ttf?raw=true";
      name = "NotoSansBrahmi-Regular.ttf";
      sha256 = "3e3b877c30f3fa51328fd4fb96bf2f66bdb922c36c446ed0bb94bde0f90729d3";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansBrahmi-Regular.ttf $out/share/fonts/truetype/NotoSansBrahmi-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Brahmi";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
