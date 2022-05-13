{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-dogra-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notoserifdogra/NotoSerifDogra-Regular.ttf?raw=true";
      name = "NotoSerifDogra-Regular.ttf";
      sha256 = "eb4ca8fe9e5d5a489fcf0915a646918e6622bce1556bba23e5f8e9ec8040b288";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSerifDogra-Regular.ttf $out/share/fonts/truetype/NotoSerifDogra-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Serif Dogra";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
