{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "familjen-grotesk-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/familjengrotesk/FamiljenGrotesk%5Bwght%5D.ttf?raw=true";
      name = "FamiljenGrotesk_wght_.ttf";
      sha256 = "2d25fc41321a04561fab20a90fc8bc9ed4d1c0743fe8ba76cc51cd3632138b80";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/familjengrotesk/FamiljenGrotesk-Italic%5Bwght%5D.ttf?raw=true";
      name = "FamiljenGrotesk-Italic_wght_.ttf";
      sha256 = "278047492643756c75533d2acb90e0644abfe5df7bc6b99f21cf72a750580634";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 FamiljenGrotesk_wght_.ttf $out/share/fonts/truetype/FamiljenGrotesk_wght_.ttf
     install -Dm644 FamiljenGrotesk-Italic_wght_.ttf $out/share/fonts/truetype/FamiljenGrotesk-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Familjen Grotesk";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
