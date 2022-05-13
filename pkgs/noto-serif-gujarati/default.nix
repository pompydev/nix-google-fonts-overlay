{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-gujarati-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notoserifgujarati/NotoSerifGujarati[wght].ttf?raw=true";
      name = "NotoSerifGujarati[wght].ttf";
      sha256 = "02883eeb9c795756c9cd8206eca66ddac06db496cee8d926fe1aa29d1dd0d354";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'NotoSerifGujarati[wght].ttf' $out/share/fonts/truetype/'NotoSerifGujarati[wght].ttf'
  '';

  meta = with lib; {
    description = "Noto Serif Gujarati";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
