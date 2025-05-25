{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ga-maamli-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/gamaamli/GaMaamli-Regular.ttf?raw=true";
      name = "GaMaamli-Regular.ttf";
      sha256 = "68466b07730b44635898ee56c5bac8d89903b62df2d93ef16e7d4120a00a6638";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 GaMaamli-Regular.ttf $out/share/fonts/truetype/GaMaamli-Regular.ttf
  '';

  meta = with lib; {
    description = "Ga Maamli";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
