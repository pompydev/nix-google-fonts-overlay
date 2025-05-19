{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-hentaigana-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notoserifhentaigana/NotoSerifHentaigana%5Bwght%5D.ttf?raw=true";
      name = "NotoSerifHentaigana_wght_.ttf";
      sha256 = "94d31f3669977a8464d7f4c6597a2c0bacab636e70548e1a3184ffc7e0a5abf1";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSerifHentaigana_wght_.ttf $out/share/fonts/truetype/NotoSerifHentaigana_wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Serif Hentaigana";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
