{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "lemonada-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/0a305919137700d960d61643f1a926d861694c76/ofl/lemonada/Lemonada[wght].ttf?raw=true";
      name = "Lemonada[wght].ttf";
      sha256 = "84134e9e1da7d593839073157980a4d38296d2be10b61469a8f3169204959ad9";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'Lemonada[wght].ttf' $out/share/fonts/truetype/'Lemonada[wght].ttf'
  '';

  meta = with lib; {
    description = "Lemonada";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
