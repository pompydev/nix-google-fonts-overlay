{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "sree-krushnadevaraya-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/sreekrushnadevaraya/SreeKrushnadevaraya-Regular.ttf?raw=true";
      name = "SreeKrushnadevaraya-Regular.ttf";
      sha256 = "3b8f5b01a08fba5af53760e274d6cd7ea6514ec2658d9c480eafcc8917d7e2cb";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SreeKrushnadevaraya-Regular.ttf $out/share/fonts/truetype/SreeKrushnadevaraya-Regular.ttf
  '';

  meta = with lib; {
    description = "Sree Krushnadevaraya";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
