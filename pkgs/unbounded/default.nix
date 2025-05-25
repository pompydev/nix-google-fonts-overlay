{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "unbounded-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/unbounded/Unbounded%5Bwght%5D.ttf?raw=true";
      name = "Unbounded_wght_.ttf";
      sha256 = "323b511be380c8d474ef030686b71aedde501f8d9cd46da558b7c40454372c3f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Unbounded_wght_.ttf $out/share/fonts/truetype/Unbounded_wght_.ttf
  '';

  meta = with lib; {
    description = "Unbounded";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
