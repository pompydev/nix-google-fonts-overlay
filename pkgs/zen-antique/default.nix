{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "zen-antique-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/zenantique/ZenAntique-Regular.ttf?raw=true";
      name = "ZenAntique-Regular.ttf";
      sha256 = "8c5cf7a136837ee705d06bbc133ea18ac06b7dd284f38aace91f5de36725c315";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ZenAntique-Regular.ttf $out/share/fonts/truetype/ZenAntique-Regular.ttf
  '';

  meta = with lib; {
    description = "Zen Antique";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
