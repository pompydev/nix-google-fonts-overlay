{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "sassy-frass-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/sassyfrass/SassyFrass-Regular.ttf?raw=true";
      name = "SassyFrass-Regular.ttf";
      sha256 = "91fc6e0f43a277ddb590faf8a97fd3016f4f1251a9dea2deaf658b1812c42899";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SassyFrass-Regular.ttf $out/share/fonts/truetype/SassyFrass-Regular.ttf
  '';

  meta = with lib; {
    description = "Sassy Frass";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
