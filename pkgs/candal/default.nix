{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "candal-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/candal/Candal.ttf?raw=true";
      name = "Candal.ttf";
      sha256 = "cf4ff425c49ab2e167fb7d166ba57f2925b6df6161a228786b291ea3875f1eb5";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Candal.ttf $out/share/fonts/truetype/Candal.ttf
  '';

  meta = with lib; {
    description = "Candal";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
