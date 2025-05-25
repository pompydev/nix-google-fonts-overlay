{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "monomakh-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/monomakh/Monomakh-Regular.ttf?raw=true";
      name = "Monomakh-Regular.ttf";
      sha256 = "c0d38d79252b758a61adb31101f202450ff11305a675481525ecdcc294b800bf";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Monomakh-Regular.ttf $out/share/fonts/truetype/Monomakh-Regular.ttf
  '';

  meta = with lib; {
    description = "Monomakh";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
