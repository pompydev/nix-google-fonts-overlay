{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "special-gothic-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/specialgothic/SpecialGothic-Regular.ttf?raw=true";
      name = "SpecialGothic-Regular.ttf";
      sha256 = "5555bfc253a2a43a3552f4acfbe9aa90734619b6ec6022bfa40067aa10f673c3";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SpecialGothic-Regular.ttf $out/share/fonts/truetype/SpecialGothic-Regular.ttf
  '';

  meta = with lib; {
    description = "Special Gothic";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
