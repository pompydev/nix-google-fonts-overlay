{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ancizar-sans-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/ancizarsans/AncizarSans%5Bwght%5D.ttf?raw=true";
      name = "AncizarSans_wght_.ttf";
      sha256 = "c99ce8a9cd997f264e6c34c2799faecd94c39acf7d06928124f9e7c12d72c743";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/ancizarsans/AncizarSans-Italic%5Bwght%5D.ttf?raw=true";
      name = "AncizarSans-Italic_wght_.ttf";
      sha256 = "834be8cfccb25c8fdec55908fdbfb3fe682de616688e10e502e22c29ecd5933d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AncizarSans_wght_.ttf $out/share/fonts/truetype/AncizarSans_wght_.ttf
     install -Dm644 AncizarSans-Italic_wght_.ttf $out/share/fonts/truetype/AncizarSans-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Ancizar Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
