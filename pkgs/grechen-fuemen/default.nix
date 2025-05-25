{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "grechen-fuemen-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/grechenfuemen/GrechenFuemen-Regular.ttf?raw=true";
      name = "GrechenFuemen-Regular.ttf";
      sha256 = "0048d2ccb3f58ce8994804be5764e074771977f4add2f3dd12dfe9a658f1adc0";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 GrechenFuemen-Regular.ttf $out/share/fonts/truetype/GrechenFuemen-Regular.ttf
  '';

  meta = with lib; {
    description = "Grechen Fuemen";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
