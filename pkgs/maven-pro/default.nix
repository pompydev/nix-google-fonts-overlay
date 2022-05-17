{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "maven-pro-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/5cc7852391fa929e4103e1948a71b928f3db9f6e/ofl/mavenpro/MavenPro%5Bwght%5D.ttf?raw=true";
      name = "MavenPro_wght_.ttf";
      sha256 = "2bd0568c49abe4a2be338203515bf36db1bde5cf5243470d81db5b8a6a210272";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 MavenPro_wght_.ttf $out/share/fonts/truetype/MavenPro_wght_.ttf
  '';

  meta = with lib; {
    description = "Maven Pro";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
