{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "lumanosimo-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/lumanosimo/Lumanosimo-Regular.ttf?raw=true";
      name = "Lumanosimo-Regular.ttf";
      sha256 = "768d2bbe3b9dcfe5cdd89a01cf4f90b9729b58ae565233a2fab0f7f48b42f662";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Lumanosimo-Regular.ttf $out/share/fonts/truetype/Lumanosimo-Regular.ttf
  '';

  meta = with lib; {
    description = "Lumanosimo";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
