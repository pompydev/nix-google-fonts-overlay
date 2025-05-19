{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-modi-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosansmodi/NotoSansModi-Regular.ttf?raw=true";
      name = "NotoSansModi-Regular.ttf";
      sha256 = "df1b8c6736fde0e7d8838370b336e4b22f84b465c81c817a8eceaab5d41ff33f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansModi-Regular.ttf $out/share/fonts/truetype/NotoSansModi-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Modi";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
