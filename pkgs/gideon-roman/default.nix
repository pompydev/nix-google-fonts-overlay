{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "gideon-roman-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/gideonroman/GideonRoman-Regular.ttf?raw=true";
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
