{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "familjen-grotesk-${version}";
  version = "2022-05-23-214203";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c5472db7405caf4c4a962843ab2d446519090161/ofl/familjengrotesk/FamiljenGrotesk%5Bwght%5D.ttf?raw=true";
      name = "FamiljenGrotesk_wght_.ttf";
      sha256 = "9bc27f9addaaf093bcd9685d9b2a7fa4903ffb2ca94f21cac79bb36d34c51038";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c5472db7405caf4c4a962843ab2d446519090161/ofl/familjengrotesk/FamiljenGrotesk-Italic%5Bwght%5D.ttf?raw=true";
      name = "FamiljenGrotesk-Italic_wght_.ttf";
      sha256 = "66ed991be0eba5601f4c2021fae41faf769e384c3c51ef976ce4ed16a2e8565f";
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
