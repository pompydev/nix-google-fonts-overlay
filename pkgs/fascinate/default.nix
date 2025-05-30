{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "fascinate-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/fascinate/Fascinate-Regular.ttf?raw=true";
      name = "Fascinate-Regular.ttf";
      sha256 = "2f3d4e1d3b1f58ba4700eba078c07d9f05d9f39513f6d29b0306ddc007bd7fec";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Fascinate-Regular.ttf $out/share/fonts/truetype/Fascinate-Regular.ttf
  '';

  meta = with lib; {
    description = "Fascinate";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
