{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "sarina-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/sarina/Sarina-Regular.ttf?raw=true";
      name = "Sarina-Regular.ttf";
      sha256 = "89c6e14d7638e48463cc6c61b2e463e3dcc5780a26197bcf7f4412d70048a4a6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Sarina-Regular.ttf $out/share/fonts/truetype/Sarina-Regular.ttf
  '';

  meta = with lib; {
    description = "Sarina";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
