{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-coptic-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosanscoptic/NotoSansCoptic-Regular.ttf?raw=true";
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
