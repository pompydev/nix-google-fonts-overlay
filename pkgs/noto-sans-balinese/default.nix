{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-balinese-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansbalinese/NotoSansBalinese[wght].ttf?raw=true";
      name = "NotoSansBalinese[wght].ttf";
      sha256 = "123ba3b34d9255902b3d12b1161e69966fd2b9cfb0683205d9e234b022e25bae";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'NotoSansBalinese[wght].ttf' $out/share/fonts/truetype/'NotoSansBalinese[wght].ttf'
  '';

  meta = with lib; {
    description = "Noto Sans Balinese";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
