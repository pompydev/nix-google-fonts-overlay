{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "alata-${version}";
  version = "2022-05-23-195233";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/592024db0c46f27093450456efc36c7c12343a37/ofl/alata/Alata-Regular.ttf?raw=true";
      name = "Alata-Regular.ttf";
      sha256 = "a9d5cb27a9e81d6a604ac677d4d8a62287ac7660e76dd38226a42ca4fc4aa51f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Alata-Regular.ttf $out/share/fonts/truetype/Alata-Regular.ttf
  '';

  meta = with lib; {
    description = "Alata";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
