{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "orienta-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/orienta/Orienta-Regular.ttf?raw=true";
      name = "Orienta-Regular.ttf";
      sha256 = "c7ca99f5789c097565d12313a23449eeb7b46a9d60342419ab696870793ca291";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Orienta-Regular.ttf $out/share/fonts/truetype/Orienta-Regular.ttf
  '';

  meta = with lib; {
    description = "Orienta";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
