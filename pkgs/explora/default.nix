{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "explora-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7705cc7f49183dd2f21c73cd9eb967ced0d977ec/ofl/explora/Explora-Regular.ttf?raw=true";
      name = "Explora-Regular.ttf";
      sha256 = "a29a1b2f59eaceab955f6667e125dfcd41406a41ebc2cce3d837c45d0405b129";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Explora-Regular.ttf $out/share/fonts/truetype/Explora-Regular.ttf
  '';

  meta = with lib; {
    description = "Explora";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
