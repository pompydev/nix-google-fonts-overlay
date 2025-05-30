{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "hedvig-letters-sans-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/hedvigletterssans/HedvigLettersSans-Regular.ttf?raw=true";
      name = "HedvigLettersSans-Regular.ttf";
      sha256 = "ee35016e71917e3960b310607480f4621d511720ebd1cedff8d44674cf09ae80";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 HedvigLettersSans-Regular.ttf $out/share/fonts/truetype/HedvigLettersSans-Regular.ttf
  '';

  meta = with lib; {
    description = "Hedvig Letters Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
