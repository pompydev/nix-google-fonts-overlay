{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "big-shoulders-inline-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/bigshouldersinline/BigShouldersInline%5Bopsz,wght%5D.ttf?raw=true";
      name = "BigShouldersInline_opsz,wght_.ttf";
      sha256 = "417c1d07898a6648faa9e3a95d7302aa44ee614e2236a2b336e16922569d1fa3";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BigShouldersInline_opsz-wght_.ttf $out/share/fonts/truetype/BigShouldersInline_opsz-wght_.ttf
  '';

  meta = with lib; {
    description = "Big Shoulders Inline";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
