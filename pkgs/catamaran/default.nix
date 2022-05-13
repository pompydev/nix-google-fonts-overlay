{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "catamaran-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/cf5f213159d5ebd3209fd5bf17f8d208e8674873/ofl/catamaran/Catamaran[wght].ttf?raw=true";
      name = "Catamaran[wght].ttf";
      sha256 = "f6ee331c381f441454225196d7930d4d0a31554d7f1f9c8c58149ca9e122b294";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'Catamaran[wght].ttf' $out/share/fonts/truetype/'Catamaran[wght].ttf'
  '';

  meta = with lib; {
    description = "Catamaran";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
