{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "mate-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/mate/Mate-Regular.ttf?raw=true";
      name = "Mate-Regular.ttf";
      sha256 = "95480334bc38a94236f03cf1c8dec24ea5a906712a559598d40b322c61d14b43";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/mate/Mate-Italic.ttf?raw=true";
      name = "Mate-Italic.ttf";
      sha256 = "52c32eaa806f093934883ee47df2cdb57fb000cbcb537c4982f45fb6decfc37f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Mate-Regular.ttf $out/share/fonts/truetype/Mate-Regular.ttf
     install -Dm644 Mate-Italic.ttf $out/share/fonts/truetype/Mate-Italic.ttf
  '';

  meta = with lib; {
    description = "Mate";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
