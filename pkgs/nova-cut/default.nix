{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "nova-cut-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/novacut/NovaCut.ttf?raw=true";
      name = "NovaCut.ttf";
      sha256 = "09b4238312770fb6a4405027dc33feef1bb1c9283d3c907fe7282960da4eb5f7";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NovaCut.ttf $out/share/fonts/truetype/NovaCut.ttf
  '';

  meta = with lib; {
    description = "Nova Cut";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
