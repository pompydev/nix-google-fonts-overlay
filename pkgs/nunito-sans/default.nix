{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "nunito-sans-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/nunitosans/NunitoSans%5BYTLC,opsz,wdth,wght%5D.ttf?raw=true";
      name = "NunitoSans_YTLC,opsz,wdth,wght_.ttf";
      sha256 = "f934d7142fb4784bf828da485b7dcbd90c0c80d514e9d49a5da0ed3a1ae2491d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/nunitosans/NunitoSans-Italic%5BYTLC,opsz,wdth,wght%5D.ttf?raw=true";
      name = "NunitoSans-Italic_YTLC,opsz,wdth,wght_.ttf";
      sha256 = "d9d5db18f3c11221a4fbb553cbc709391c1179964c7eaa4466ef43c78aa4492f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NunitoSans_YTLC,opsz,wdth,wght_.ttf $out/share/fonts/truetype/NunitoSans_YTLC,opsz,wdth,wght_.ttf
     install -Dm644 NunitoSans-Italic_YTLC,opsz,wdth,wght_.ttf $out/share/fonts/truetype/NunitoSans-Italic_YTLC,opsz,wdth,wght_.ttf
  '';

  meta = with lib; {
    description = "Nunito Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
