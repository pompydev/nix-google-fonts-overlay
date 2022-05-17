{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-hebrew-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notoserifhebrew/NotoSerifHebrew%5Bwdth,wght%5D.ttf?raw=true";
      name = "NotoSerifHebrew_wdth,wght_.ttf";
      sha256 = "b16cd8d47acc53746c84a221c6aeea9f2d116477474796f006107695e5980981";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSerifHebrew_wdth,wght_.ttf $out/share/fonts/truetype/NotoSerifHebrew_wdth,wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Serif Hebrew";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
