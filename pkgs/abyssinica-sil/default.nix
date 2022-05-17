{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "abyssinica-sil-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/80ffd33a4822fd307c1a053ad8d42c01e1a3e199/ofl/abyssinicasil/AbyssinicaSIL-Regular.ttf?raw=true";
      name = "AbyssinicaSIL-Regular.ttf";
      sha256 = "bf103bdc35c366aea65f5303860627bc68b9d3afb57f1557cb8892a0a08e5a40";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AbyssinicaSIL-Regular.ttf $out/share/fonts/truetype/AbyssinicaSIL-Regular.ttf
  '';

  meta = with lib; {
    description = "Abyssinica SIL";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
