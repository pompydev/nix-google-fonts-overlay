{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "archivo-narrow-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/archivonarrow/ArchivoNarrow%5Bwght%5D.ttf?raw=true";
      name = "ArchivoNarrow_wght_.ttf";
      sha256 = "adbe027f625c8393ae0f6e174e32e233dda485bc3eda5153ce428275394ef97f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/archivonarrow/ArchivoNarrow-Italic%5Bwght%5D.ttf?raw=true";
      name = "ArchivoNarrow-Italic_wght_.ttf";
      sha256 = "147c09214be086bf1c70311ffb66f4f5a252e48f828f1d49e35ae56951016cc6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ArchivoNarrow_wght_.ttf $out/share/fonts/truetype/ArchivoNarrow_wght_.ttf
     install -Dm644 ArchivoNarrow-Italic_wght_.ttf $out/share/fonts/truetype/ArchivoNarrow-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Archivo Narrow";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
