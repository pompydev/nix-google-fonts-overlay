{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "road-rage-${version}";
  version = "2022-05-23-231859";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/3e0358068d401966eb42ef11b2ae1af06430ce83/ofl/roadrage/RoadRage-Regular.ttf?raw=true";
      name = "RoadRage-Regular.ttf";
      sha256 = "b25b8113340bd83520f92a32a13d8d2e39c46fcc595cf39e8ae9e9a4b6332eb8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 RoadRage-Regular.ttf $out/share/fonts/truetype/RoadRage-Regular.ttf
  '';

  meta = with lib; {
    description = "Road Rage";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
