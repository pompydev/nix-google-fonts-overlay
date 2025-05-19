{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-tai-le-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosanstaile/NotoSansTaiLe-Regular.ttf?raw=true";
      name = "NotoSansTaiLe-Regular.ttf";
      sha256 = "eeb4c41d8e1a6075f7e580cc159dff424e2f61e64f5edcd57b5e8ca57d58a2ea";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansTaiLe-Regular.ttf $out/share/fonts/truetype/NotoSansTaiLe-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Tai Le";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
