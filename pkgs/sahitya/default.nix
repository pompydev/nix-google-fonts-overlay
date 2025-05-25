{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "sahitya-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/sahitya/Sahitya-Regular.ttf?raw=true";
      name = "Sahitya-Regular.ttf";
      sha256 = "f43e57c9eb3c936e195009a5755906d34cdffb7e5ac4d0a51d260150f118ee62";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/sahitya/Sahitya-Bold.ttf?raw=true";
      name = "Sahitya-Bold.ttf";
      sha256 = "9feb27b5d2980b741355bb6240d0f0b44d0f4cfdb15c11980049f4750fcaa88a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Sahitya-Regular.ttf $out/share/fonts/truetype/Sahitya-Regular.ttf
     install -Dm644 Sahitya-Bold.ttf $out/share/fonts/truetype/Sahitya-Bold.ttf
  '';

  meta = with lib; {
    description = "Sahitya";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
