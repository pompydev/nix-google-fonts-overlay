{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "spirax-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/spirax/Spirax-Regular.ttf?raw=true";
      name = "Spirax-Regular.ttf";
      sha256 = "e509975c0680e447e6be89467f7f0bebec6d4cb0a8b75d7b6bb6d6fd7e2d5b65";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Spirax-Regular.ttf $out/share/fonts/truetype/Spirax-Regular.ttf
  '';

  meta = with lib; {
    description = "Spirax";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
