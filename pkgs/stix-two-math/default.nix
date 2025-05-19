{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "stix-two-math-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/stixtwomath/STIXTwoMath-Regular.ttf?raw=true";
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
