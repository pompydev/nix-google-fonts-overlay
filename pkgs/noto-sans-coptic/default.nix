{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-coptic-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosanscoptic/NotoSansCoptic-Regular.ttf?raw=true";
      name = "NotoSansCoptic-Regular.ttf";
      sha256 = "51990af1bb0df7be8bfe98fda97769cecfa36eee15381e5504df400276abd735";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansCoptic-Regular.ttf $out/share/fonts/truetype/NotoSansCoptic-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Coptic";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
