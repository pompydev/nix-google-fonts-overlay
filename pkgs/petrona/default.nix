{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "petrona-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/fafa568b91c1e9b19cf9288497c632d2450f8ce4/ofl/petrona/Petrona[wght].ttf?raw=true";
      name = "Petrona[wght].ttf";
      sha256 = "0ede77fbf726541cf93ece7b721a7b069f004cb413ab205f74963560015ab075";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/fafa568b91c1e9b19cf9288497c632d2450f8ce4/ofl/petrona/Petrona-Italic[wght].ttf?raw=true";
      name = "Petrona-Italic[wght].ttf";
      sha256 = "f4ad599093d29a668e2f945e027b47baee8476647d92bc8c23a89b0f86c08078";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'Petrona[wght].ttf' $out/share/fonts/truetype/'Petrona[wght].ttf'
     install -Dm644 'Petrona-Italic[wght].ttf' $out/share/fonts/truetype/'Petrona-Italic[wght].ttf'
  '';

  meta = with lib; {
    description = "Petrona";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
