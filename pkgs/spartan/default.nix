{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "spartan-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/3ac54d012eccc2e4c4d87fd2cc7adce528139d8b/ofl/spartan/Spartan%5Bwght%5D.ttf?raw=true";
      name = "Spartan_wght_.ttf";
      sha256 = "74658008dc28abd215da0f26a849deb9e6fecc88d36fdf1565f7d2c4fe253516";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Spartan_wght_.ttf $out/share/fonts/truetype/Spartan_wght_.ttf
  '';

  meta = with lib; {
    description = "Spartan";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
