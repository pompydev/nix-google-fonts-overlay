{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "sigmar-one-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/sigmarone/SigmarOne-Regular.ttf?raw=true";
      name = "SigmarOne-Regular.ttf";
      sha256 = "0817eb698a5c4aac2c07bb84be1ead806494c489da468db23f5ffd9bcf3f0970";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SigmarOne-Regular.ttf $out/share/fonts/truetype/SigmarOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Sigmar One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
