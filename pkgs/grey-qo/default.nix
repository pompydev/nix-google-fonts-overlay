{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "grey-qo-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/greyqo/GreyQo-Regular.ttf?raw=true";
      name = "GreyQo-Regular.ttf";
      sha256 = "1ed4701c24145a2a3b4271c48fe27d3ae082b98efc7619c1e7ee5b29ffe2cd67";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 GreyQo-Regular.ttf $out/share/fonts/truetype/GreyQo-Regular.ttf
  '';

  meta = with lib; {
    description = "Grey Qo";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
