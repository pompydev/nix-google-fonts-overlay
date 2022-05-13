{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "hachi-maru-pop-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a9f5b0a285a8f2883b3448580db61f6289e3187b/ofl/hachimarupop/HachiMaruPop-Regular.ttf?raw=true";
      name = "HachiMaruPop-Regular.ttf";
      sha256 = "78408910c8f1a2f174a279cbc1484b48b71780039eba3fe1be2bfcc5d4df3f98";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 HachiMaruPop-Regular.ttf $out/share/fonts/truetype/HachiMaruPop-Regular.ttf
  '';

  meta = with lib; {
    description = "Hachi Maru Pop";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
