{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "gasoek-one-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/gasoekone/GasoekOne-Regular.ttf?raw=true";
      name = "GasoekOne-Regular.ttf";
      sha256 = "73a6b8e0d12a56f0a070f19b44a93ae050f98eb926da5d2a7c8d6db92bd8d9c3";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 GasoekOne-Regular.ttf $out/share/fonts/truetype/GasoekOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Gasoek One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
