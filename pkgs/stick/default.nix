{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "stick-${version}";
  version = "2022-05-23-231859";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/74eda7af4dd3ff135edb525b253c2625a1d10da6/ofl/stick/Stick-Regular.ttf?raw=true";
      name = "Stick-Regular.ttf";
      sha256 = "0e582d72b5125c7847d1c46b658333194f7a3f70bfa210d2f8cae1a596a17857";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Stick-Regular.ttf $out/share/fonts/truetype/Stick-Regular.ttf
  '';

  meta = with lib; {
    description = "Stick";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
