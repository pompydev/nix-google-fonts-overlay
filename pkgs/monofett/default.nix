{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "monofett-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/monofett/Monofett-Regular.ttf?raw=true";
      name = "Monofett-Regular.ttf";
      sha256 = "1483f18841a24238172d6f3462a3ea790b7a3e6ca8bb55d404dede93669238d5";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Monofett-Regular.ttf $out/share/fonts/truetype/Monofett-Regular.ttf
  '';

  meta = with lib; {
    description = "Monofett";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
