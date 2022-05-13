{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "maven-pro-${version}";
  version = "2022-04-21-105732";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/5cc7852391fa929e4103e1948a71b928f3db9f6e/ofl/mavenpro/MavenPro[wght].ttf?raw=true";
      name = "MavenPro[wght].ttf";
      sha256 = "2bd0568c49abe4a2be338203515bf36db1bde5cf5243470d81db5b8a6a210272";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'MavenPro[wght].ttf' $out/share/fonts/truetype/'MavenPro[wght].ttf'
  '';

  meta = with lib; {
    description = "Maven Pro";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
