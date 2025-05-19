{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ysabeau-office-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/ysabeauoffice/YsabeauOffice%5Bwght%5D.ttf?raw=true";
      name = "YsabeauOffice_wght_.ttf";
      sha256 = "0f305c8451c1566f0ae62dca9921831fa59f09f6468b012fd6c9161362b5d360";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/ysabeauoffice/YsabeauOffice-Italic%5Bwght%5D.ttf?raw=true";
      name = "YsabeauOffice-Italic_wght_.ttf";
      sha256 = "550a9fd72dae5fd7ea16829a60817df9049529067e2d910ab687dab8761c0b9c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 YsabeauOffice_wght_.ttf $out/share/fonts/truetype/YsabeauOffice_wght_.ttf
     install -Dm644 YsabeauOffice-Italic_wght_.ttf $out/share/fonts/truetype/YsabeauOffice-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Ysabeau Office";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
