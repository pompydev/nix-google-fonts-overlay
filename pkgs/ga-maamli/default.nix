{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ga-maamli-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/gamaamli/GaMaamli-Regular.ttf?raw=true";
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
