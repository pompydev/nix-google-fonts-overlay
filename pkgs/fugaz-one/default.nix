{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "fugaz-one-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/fugazone/FugazOne-Regular.ttf?raw=true";
      name = "FugazOne-Regular.ttf";
      sha256 = "14fd5becce8b0ae987e44b3f9fa9e3e6c87463e9585ac15db6c8271462068a62";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 FugazOne-Regular.ttf $out/share/fonts/truetype/FugazOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Fugaz One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
