{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "strong-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/strong/Strong-Regular.ttf?raw=true";
      name = "Strong-Regular.ttf";
      sha256 = "4cae5278cb372d0ec20fe7b00a969a9766b5ecab9f1a16c3d9d31f2fa8c0b461";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Strong-Regular.ttf $out/share/fonts/truetype/Strong-Regular.ttf
  '';

  meta = with lib; {
    description = "Strong";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
