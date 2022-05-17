{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-yezidi-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notoserifyezidi/NotoSerifYezidi%5Bwght%5D.ttf?raw=true";
      name = "NotoSerifYezidi_wght_.ttf";
      sha256 = "ced8cdb5a97bc0646697fb834a5ba098cab86ba50aebf7727a915d4af76ee91a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSerifYezidi_wght_.ttf $out/share/fonts/truetype/NotoSerifYezidi_wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Serif Yezidi";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
