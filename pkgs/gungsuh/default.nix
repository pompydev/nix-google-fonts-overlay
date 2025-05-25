{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "gungsuh-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/gungsuh/Gungsuh-Regular.ttf?raw=true";
      name = "Gungsuh-Regular.ttf";
      sha256 = "e0887c3b3a92f0ebc604cbd5e94ad6d0dad4ed3ffa624f6bae9a95f2d4d06735";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Gungsuh-Regular.ttf $out/share/fonts/truetype/Gungsuh-Regular.ttf
  '';

  meta = with lib; {
    description = "Gungsuh";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
