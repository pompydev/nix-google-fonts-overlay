{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "porter-sans-block-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/portersansblock/PorterSansBlock-Regular.ttf?raw=true";
      name = "PorterSansBlock-Regular.ttf";
      sha256 = "760943d1b089f37c8d079f3e0347e2b0858c8598894f2c04b7dc52cbd2ab4dfd";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PorterSansBlock-Regular.ttf $out/share/fonts/truetype/PorterSansBlock-Regular.ttf
  '';

  meta = with lib; {
    description = "Porter Sans Block";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
