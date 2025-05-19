{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-yezidi-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notoserifyezidi/NotoSerifYezidi%5Bwght%5D.ttf?raw=true";
      name = "NotoSerifYezidi_wght_.ttf";
      sha256 = "807b3ec568b2333601e297484565e1ff48adb014aa4d8aaa7eba23dc04e44e05";
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
