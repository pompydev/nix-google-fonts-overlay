{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-emoji-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notoemoji/NotoEmoji%5Bwght%5D.ttf?raw=true";
      name = "NotoEmoji_wght_.ttf";
      sha256 = "de6c18832938afc99caf132b39d6a30a19bac7f2e812e28db2535b4608d27551";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoEmoji_wght_.ttf $out/share/fonts/truetype/NotoEmoji_wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Emoji";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
