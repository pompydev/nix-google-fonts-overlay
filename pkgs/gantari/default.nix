{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "gantari-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/gantari/Gantari%5Bwght%5D.ttf?raw=true";
      name = "Gantari_wght_.ttf";
      sha256 = "16b83edd620efd401c7855ebb96694718c29f55f4198913dfad4791591796e71";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/gantari/Gantari-Italic%5Bwght%5D.ttf?raw=true";
      name = "Gantari-Italic_wght_.ttf";
      sha256 = "968f9aa4c6a6f7ef4f6995533c9492367b4c7b5e8b4912db555473ecfda24e0f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Gantari_wght_.ttf $out/share/fonts/truetype/Gantari_wght_.ttf
     install -Dm644 Gantari-Italic_wght_.ttf $out/share/fonts/truetype/Gantari-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Gantari";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
