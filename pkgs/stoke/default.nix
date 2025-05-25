{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "stoke-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/stoke/Stoke-Light.ttf?raw=true";
      name = "Stoke-Light.ttf";
      sha256 = "6d7657845f2003b7119bb981d4f2363182c77f3a20d1a3a3b2b4465814e9dfb8";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/stoke/Stoke-Regular.ttf?raw=true";
      name = "Stoke-Regular.ttf";
      sha256 = "da50d1746c29010693ff20832aeb0caa94b3b0566443057341e6df3c715df8b2";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Stoke-Light.ttf $out/share/fonts/truetype/Stoke-Light.ttf
     install -Dm644 Stoke-Regular.ttf $out/share/fonts/truetype/Stoke-Regular.ttf
  '';

  meta = with lib; {
    description = "Stoke";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
