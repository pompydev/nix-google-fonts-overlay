{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "average-sans-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/averagesans/AverageSans-Regular.ttf?raw=true";
      name = "AverageSans-Regular.ttf";
      sha256 = "f978bb0eb5ad93b02f3a8e4ef0ed525a1192b4076e8a8d0bb37b2546a297762e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AverageSans-Regular.ttf $out/share/fonts/truetype/AverageSans-Regular.ttf
  '';

  meta = with lib; {
    description = "Average Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
