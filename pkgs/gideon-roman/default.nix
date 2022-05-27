{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "gideon-roman-${version}";
  version = "2022-05-23-214203";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b1573ad2c7d24dc107e5935abcdeef17fe35bd4f/ofl/gideonroman/GideonRoman-Regular.ttf?raw=true";
      name = "GideonRoman-Regular.ttf";
      sha256 = "8edd923657529e420382016e8f0a395d2d526c391328fc97cf4d42ed2d18bdce";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 GideonRoman-Regular.ttf $out/share/fonts/truetype/GideonRoman-Regular.ttf
  '';

  meta = with lib; {
    description = "Gideon Roman";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
