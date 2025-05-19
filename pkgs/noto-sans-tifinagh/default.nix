{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-tifinagh-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosanstifinagh/NotoSansTifinagh-Regular.ttf?raw=true";
      name = "NotoSansTifinagh-Regular.ttf";
      sha256 = "b08755bdee9835ebbca1095460e36a9e2f3ae396919fd0fa2377d9b4a3388f7e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansTifinagh-Regular.ttf $out/share/fonts/truetype/NotoSansTifinagh-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Tifinagh";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
