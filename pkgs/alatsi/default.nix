{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "alatsi-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/alatsi/Alatsi-Regular.ttf?raw=true";
      name = "Alatsi-Regular.ttf";
      sha256 = "16b62400d74df555a35e145d0d8835e4f06e6d5c4707a8d0faf76d4e99910292";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Alatsi-Regular.ttf $out/share/fonts/truetype/Alatsi-Regular.ttf
  '';

  meta = with lib; {
    description = "Alatsi";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
