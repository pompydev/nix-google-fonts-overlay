{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-cypro-minoan-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosanscyprominoan/NotoSansCyproMinoan-Regular.ttf?raw=true";
      name = "NotoSansCyproMinoan-Regular.ttf";
      sha256 = "e2c9c85ce7044f895443e97653ca440e7499d10c59ef780c12e592558a7c2bda";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansCyproMinoan-Regular.ttf $out/share/fonts/truetype/NotoSansCyproMinoan-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Cypro Minoan";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
