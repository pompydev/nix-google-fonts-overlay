{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "stix-two-math-${version}";
  version = "2022-05-23-231859";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/76d97cb481958f9bb0976a453f8126f8e2ea87ab/ofl/stixtwomath/STIXTwoMath-Regular.ttf?raw=true";
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
