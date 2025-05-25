{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "gidugu-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/gidugu/Gidugu-Regular.ttf?raw=true";
      name = "Gidugu-Regular.ttf";
      sha256 = "1d10013a9e298e9fe79015973e484f3641bf8a1e7b5b58231142853a14bc80f4";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Gidugu-Regular.ttf $out/share/fonts/truetype/Gidugu-Regular.ttf
  '';

  meta = with lib; {
    description = "Gidugu";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
