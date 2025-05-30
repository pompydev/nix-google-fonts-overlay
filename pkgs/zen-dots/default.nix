{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "zen-dots-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/zendots/ZenDots-Regular.ttf?raw=true";
      name = "ZenDots-Regular.ttf";
      sha256 = "2f81a9f4c26f302d87a40792e048cd7193c886aa50fa6792a4b4fb6266c25609";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ZenDots-Regular.ttf $out/share/fonts/truetype/ZenDots-Regular.ttf
  '';

  meta = with lib; {
    description = "Zen Dots";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
