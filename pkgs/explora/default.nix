{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "explora-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/explora/Explora-Regular.ttf?raw=true";
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
