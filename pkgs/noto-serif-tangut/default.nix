{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-tangut-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notoseriftangut/NotoSerifTangut-Regular.ttf?raw=true";
      name = "NotoSerifTangut-Regular.ttf";
      sha256 = "0db5db0492d049c5bcaa3910ece7db3917475a6e91b6c74b5125760b01b3ef5d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSerifTangut-Regular.ttf $out/share/fonts/truetype/NotoSerifTangut-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Serif Tangut";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
