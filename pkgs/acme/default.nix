{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "acme-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/acme/Acme-Regular.ttf?raw=true";
      name = "Acme-Regular.ttf";
      sha256 = "76fdb582f54653c27274d5cd986f994c28d7fa7d323e7eb9ee14ce8875d39dc4";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Acme-Regular.ttf $out/share/fonts/truetype/Acme-Regular.ttf
  '';

  meta = with lib; {
    description = "Acme";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
