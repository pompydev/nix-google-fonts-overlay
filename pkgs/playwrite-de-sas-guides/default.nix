{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-de-sas-guides-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/playwritedesasguides/PlaywriteDESASGuides-Regular.ttf?raw=true";
      name = "PlaywriteDESASGuides-Regular.ttf";
      sha256 = "3c10d47134520d0479d6eecf65a2c71f10578316867407b613b363131e10b339";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteDESASGuides-Regular.ttf $out/share/fonts/truetype/PlaywriteDESASGuides-Regular.ttf
  '';

  meta = with lib; {
    description = "Playwrite DE SAS Guides";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
