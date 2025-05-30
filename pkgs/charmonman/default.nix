{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "charmonman-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/charmonman/Charmonman-Regular.ttf?raw=true";
      name = "Charmonman-Regular.ttf";
      sha256 = "7ec5575c6c87a6be69de7839b3ecd1027b7ba6510ad3e49bc30b73cc9ee1bce0";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/charmonman/Charmonman-Bold.ttf?raw=true";
      name = "Charmonman-Bold.ttf";
      sha256 = "8bf4f82298997010662de35cec504c0504456e51d3d9a9a6b4f3788e4b04abee";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Charmonman-Regular.ttf $out/share/fonts/truetype/Charmonman-Regular.ttf
     install -Dm644 Charmonman-Bold.ttf $out/share/fonts/truetype/Charmonman-Bold.ttf
  '';

  meta = with lib; {
    description = "Charmonman";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
