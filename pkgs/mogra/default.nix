{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "mogra-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/mogra/Mogra-Regular.ttf?raw=true";
      name = "Mogra-Regular.ttf";
      sha256 = "1d7133f5926cf5e7042b587b838bc5c5bcfe6c86b19157afd544c71a630159d8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Mogra-Regular.ttf $out/share/fonts/truetype/Mogra-Regular.ttf
  '';

  meta = with lib; {
    description = "Mogra";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
