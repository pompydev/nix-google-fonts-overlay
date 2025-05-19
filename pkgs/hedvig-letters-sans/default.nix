{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "hedvig-letters-sans-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/hedvigletterssans/HedvigLettersSans-Regular.ttf?raw=true";
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
