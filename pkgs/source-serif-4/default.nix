{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "source-serif-4-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7b203a635ebe80801c80f29633d4fc467cd1214e/ofl/sourceserif4/SourceSerif4[opsz,wght].ttf?raw=true";
      name = "SourceSerif4[opsz,wght].ttf";
      sha256 = "97b2d4da6e3cb494b5a1e66ae176914d852ccabef49e0c02c0df25f3e39aca0b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7b203a635ebe80801c80f29633d4fc467cd1214e/ofl/sourceserif4/SourceSerif4-Italic[opsz,wght].ttf?raw=true";
      name = "SourceSerif4-Italic[opsz,wght].ttf";
      sha256 = "15fbc7e4679489a501998c3669272637a6646388ef7e4bd77eebb5bf967a1f42";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'SourceSerif4[opsz,wght].ttf' $out/share/fonts/truetype/'SourceSerif4[opsz,wght].ttf'
     install -Dm644 'SourceSerif4-Italic[opsz,wght].ttf' $out/share/fonts/truetype/'SourceSerif4-Italic[opsz,wght].ttf'
  '';

  meta = with lib; {
    description = "Source Serif 4";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
