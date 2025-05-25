{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "beth-ellen-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/bethellen/BethEllen-Regular.ttf?raw=true";
      name = "BethEllen-Regular.ttf";
      sha256 = "ca49471aec90a19df63f583f5a60d514f012559a8a2d17f62f8a389fe90726d7";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BethEllen-Regular.ttf $out/share/fonts/truetype/BethEllen-Regular.ttf
  '';

  meta = with lib; {
    description = "Beth Ellen";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
