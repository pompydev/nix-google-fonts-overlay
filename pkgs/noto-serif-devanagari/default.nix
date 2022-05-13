{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-devanagari-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notoserifdevanagari/NotoSerifDevanagari[wdth,wght].ttf?raw=true";
      name = "NotoSerifDevanagari[wdth,wght].ttf";
      sha256 = "f10eb2840c882e0eb25dae9134861df47201b697ba9ad412e9150160aead7725";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'NotoSerifDevanagari[wdth,wght].ttf' $out/share/fonts/truetype/'NotoSerifDevanagari[wdth,wght].ttf'
  '';

  meta = with lib; {
    description = "Noto Serif Devanagari";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
