{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-math-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosansmath/NotoSansMath-Regular.ttf?raw=true";
      name = "NotoSansMath-Regular.ttf";
      sha256 = "3f495fe933c06786e4d5f6d86b8ee70b6753a68ee3b9d87528726de0f6e2c47d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansMath-Regular.ttf $out/share/fonts/truetype/NotoSansMath-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Math";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
