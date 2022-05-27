{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "sassy-frass-${version}";
  version = "2022-05-23-231859";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/033dd21ad1c5a398424a83a14083fd9c4f098ca2/ofl/sassyfrass/SassyFrass-Regular.ttf?raw=true";
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
