{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "tiny5-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/tiny5/Tiny5-Regular.ttf?raw=true";
      name = "Tiny5-Regular.ttf";
      sha256 = "cb8168f80cfee2f47f6db59f2a7afbde31cdcdcdcf262e7a993e4d468a5bf4b0";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Tiny5-Regular.ttf $out/share/fonts/truetype/Tiny5-Regular.ttf
  '';

  meta = with lib; {
    description = "Tiny5";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
