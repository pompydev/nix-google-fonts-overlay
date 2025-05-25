{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "freeman-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/freeman/Freeman-Regular.ttf?raw=true";
      name = "Freeman-Regular.ttf";
      sha256 = "48fac93ede204981c621a1fb039bdfcbbdf7e646aa7a7f823d4191bcebe16f49";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Freeman-Regular.ttf $out/share/fonts/truetype/Freeman-Regular.ttf
  '';

  meta = with lib; {
    description = "Freeman";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
