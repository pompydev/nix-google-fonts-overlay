{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-gothic-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansgothic/NotoSansGothic-Regular.ttf?raw=true";
      name = "NotoSansGothic-Regular.ttf";
      sha256 = "c85e7780c3adda90f56591914d89c3ed4dc9ea1b23d7e3a462fcd39e888ec70f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansGothic-Regular.ttf $out/share/fonts/truetype/NotoSansGothic-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Gothic";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
