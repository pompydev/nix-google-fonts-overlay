{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-tai-viet-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosanstaiviet/NotoSansTaiViet-Regular.ttf?raw=true";
      name = "NotoSansTaiViet-Regular.ttf";
      sha256 = "ba2a5346d6a9c041663fc835cf090efcbb9feb81a620245e7a64ecf6caafc59d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansTaiViet-Regular.ttf $out/share/fonts/truetype/NotoSansTaiViet-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Tai Viet";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
