{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "creepster-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/creepster/Creepster-Regular.ttf?raw=true";
      name = "Creepster-Regular.ttf";
      sha256 = "402aeb734586c74aecd3dbdc454589b1fb12e2e1c71f782fd019ae68066d9f44";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Creepster-Regular.ttf $out/share/fonts/truetype/Creepster-Regular.ttf
  '';

  meta = with lib; {
    description = "Creepster";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
