{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "archivo-narrow-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d4c821625c44c4adb6dbf7289a250597c0c99660/ofl/archivonarrow/ArchivoNarrow[wght].ttf?raw=true";
      name = "ArchivoNarrow[wght].ttf";
      sha256 = "4d0dd5679371ad68be11b71a1e5d6fb9dab30276025afa0ca43ac5c7b224e9ec";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d4c821625c44c4adb6dbf7289a250597c0c99660/ofl/archivonarrow/ArchivoNarrow-Italic[wght].ttf?raw=true";
      name = "ArchivoNarrow-Italic[wght].ttf";
      sha256 = "56f4f8d170f2fa8e29cbee7bf4d2b037c8a0d10c220e7f9bc844feaea7cf07ef";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'ArchivoNarrow[wght].ttf' $out/share/fonts/truetype/'ArchivoNarrow[wght].ttf'
     install -Dm644 'ArchivoNarrow-Italic[wght].ttf' $out/share/fonts/truetype/'ArchivoNarrow-Italic[wght].ttf'
  '';

  meta = with lib; {
    description = "Archivo Narrow";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
