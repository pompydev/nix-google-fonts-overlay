{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "petrona-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/fafa568b91c1e9b19cf9288497c632d2450f8ce4/ofl/petrona/Petrona%5Bwght%5D.ttf?raw=true";
      name = "Petrona_wght_.ttf";
      sha256 = "0ede77fbf726541cf93ece7b721a7b069f004cb413ab205f74963560015ab075";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/fafa568b91c1e9b19cf9288497c632d2450f8ce4/ofl/petrona/Petrona-Italic%5Bwght%5D.ttf?raw=true";
      name = "Petrona-Italic_wght_.ttf";
      sha256 = "f4ad599093d29a668e2f945e027b47baee8476647d92bc8c23a89b0f86c08078";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Petrona_wght_.ttf $out/share/fonts/truetype/Petrona_wght_.ttf
     install -Dm644 Petrona-Italic_wght_.ttf $out/share/fonts/truetype/Petrona-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Petrona";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
