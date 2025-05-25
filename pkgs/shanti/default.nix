{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "shanti-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/shanti/Shanti-Regular.ttf?raw=true";
      name = "Shanti-Regular.ttf";
      sha256 = "cc7320c8c4579293f4389ac391b4189c59d8276c3ac1f3b902bf0b0f0e2e9278";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Shanti-Regular.ttf $out/share/fonts/truetype/Shanti-Regular.ttf
  '';

  meta = with lib; {
    description = "Shanti";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
