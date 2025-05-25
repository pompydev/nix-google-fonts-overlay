{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-dives-akuru-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notoserifdivesakuru/NotoSerifDivesAkuru-Regular.ttf?raw=true";
      name = "NotoSerifDivesAkuru-Regular.ttf";
      sha256 = "8b6753cdf9e4703af44f7f196994912f6fa683a176d45b49d4c8624030d544dd";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSerifDivesAkuru-Regular.ttf $out/share/fonts/truetype/NotoSerifDivesAkuru-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Serif Dives Akuru";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
