{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "danfo-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/danfo/Danfo%5BELSH%5D.ttf?raw=true";
      name = "Danfo_ELSH_.ttf";
      sha256 = "7e88c371ac63b0e4d0140812e703a3e021d37147a0df4f167ac324255a39d42f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Danfo_ELSH_.ttf $out/share/fonts/truetype/Danfo_ELSH_.ttf
  '';

  meta = with lib; {
    description = "Danfo";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
