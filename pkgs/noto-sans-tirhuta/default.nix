{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-tirhuta-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosanstirhuta/NotoSansTirhuta-Regular.ttf?raw=true";
      name = "NotoSansTirhuta-Regular.ttf";
      sha256 = "ad7123ee63118b83ed2f723591e5e861baad8dd157508b8339362850c6036efe";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansTirhuta-Regular.ttf $out/share/fonts/truetype/NotoSansTirhuta-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Tirhuta";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
