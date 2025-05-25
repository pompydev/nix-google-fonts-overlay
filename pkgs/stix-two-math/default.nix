{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "stix-two-math-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/stixtwomath/STIXTwoMath-Regular.ttf?raw=true";
      name = "STIXTwoMath-Regular.ttf";
      sha256 = "562551b15b836e6e01d1b7350909baf3c8c8d83260c1190fbf4544333e6936de";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 STIXTwoMath-Regular.ttf $out/share/fonts/truetype/STIXTwoMath-Regular.ttf
  '';

  meta = with lib; {
    description = "STIX Two Math";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
