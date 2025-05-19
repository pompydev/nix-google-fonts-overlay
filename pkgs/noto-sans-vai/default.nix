{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-vai-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosansvai/NotoSansVai-Regular.ttf?raw=true";
      name = "NotoSansVai-Regular.ttf";
      sha256 = "1ee63dafc2d2a71c42d7bb06259ae1728d8fd155bc752254a1cc5a7002e13a8d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansVai-Regular.ttf $out/share/fonts/truetype/NotoSansVai-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Vai";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
