{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "londrina-shadow-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/londrinashadow/LondrinaShadow-Regular.ttf?raw=true";
      name = "LondrinaShadow-Regular.ttf";
      sha256 = "bdc4a66213c2bed3a0e58912bb2e47f7b0ea51b07d291a43896eed5c87e01a21";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 LondrinaShadow-Regular.ttf $out/share/fonts/truetype/LondrinaShadow-Regular.ttf
  '';

  meta = with lib; {
    description = "Londrina Shadow";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
