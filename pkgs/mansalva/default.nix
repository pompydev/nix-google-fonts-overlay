{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "mansalva-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a5784483f71ba1bce0ecb5b2b82ea11713078c01/ofl/mansalva/Mansalva-Regular.ttf?raw=true";
      name = "Mansalva-Regular.ttf";
      sha256 = "b6d01ecd924ad830c3bb49d1e4a62843dfea341385d94f62900963f3ddb8c725";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Mansalva-Regular.ttf $out/share/fonts/truetype/Mansalva-Regular.ttf
  '';

  meta = with lib; {
    description = "Mansalva";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
