{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "convergence-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/convergence/Convergence-Regular.ttf?raw=true";
      name = "Convergence-Regular.ttf";
      sha256 = "4e17355228610042e6922db7f19d9d87eb99b4f09ba3a12be8a2800bad0e9904";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Convergence-Regular.ttf $out/share/fonts/truetype/Convergence-Regular.ttf
  '';

  meta = with lib; {
    description = "Convergence";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
