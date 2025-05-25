{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-math-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosansmath/NotoSansMath-Regular.ttf?raw=true";
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
