{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "yuji-hentaigana-akebono-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/yujihentaiganaakebono/YujiHentaiganaAkebono-Regular.ttf?raw=true";
      name = "YujiHentaiganaAkebono-Regular.ttf";
      sha256 = "8e387eeb5c24cd2945d8804caab8f97985b694cec8d2b228da63cceb16c7a8f3";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 YujiHentaiganaAkebono-Regular.ttf $out/share/fonts/truetype/YujiHentaiganaAkebono-Regular.ttf
  '';

  meta = with lib; {
    description = "Yuji Hentaigana Akebono";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
