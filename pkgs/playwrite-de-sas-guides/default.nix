{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-de-sas-guides-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/playwritedesasguides/PlaywriteDESASGuides-Regular.ttf?raw=true";
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
