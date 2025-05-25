{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ole-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/ole/Ole-Regular.ttf?raw=true";
      name = "Ole-Regular.ttf";
      sha256 = "6071527486096be714c64a8b04181f78556cba14a95f596323c0d3560e406e73";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Ole-Regular.ttf $out/share/fonts/truetype/Ole-Regular.ttf
  '';

  meta = with lib; {
    description = "Ole";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
