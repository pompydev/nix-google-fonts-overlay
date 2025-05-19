{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-samaritan-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosanssamaritan/NotoSansSamaritan-Regular.ttf?raw=true";
      name = "NotoSansSamaritan-Regular.ttf";
      sha256 = "b2e86cdcac51ecae8948cac8a6925bb1c2e98f8a64e5cf83bb05f1294cd79810";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansSamaritan-Regular.ttf $out/share/fonts/truetype/NotoSansSamaritan-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Samaritan";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
