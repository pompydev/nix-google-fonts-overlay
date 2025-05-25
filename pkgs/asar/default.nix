{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "asar-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/asar/Asar-Regular.ttf?raw=true";
      name = "Asar-Regular.ttf";
      sha256 = "8b4147354af009836d031f50af3e0450768d78b1e0e0281c7df17cd26440cc2e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Asar-Regular.ttf $out/share/fonts/truetype/Asar-Regular.ttf
  '';

  meta = with lib; {
    description = "Asar";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
