{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-shavian-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansshavian/NotoSansShavian-Regular.ttf?raw=true";
      name = "NotoSansShavian-Regular.ttf";
      sha256 = "c0135179225f1cd0d25089f5cab2e34d71b43cc1c4c413e153764e8d3ade1a20";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansShavian-Regular.ttf $out/share/fonts/truetype/NotoSansShavian-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Shavian";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
