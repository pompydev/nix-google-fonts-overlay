{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-ahom-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notoserifahom/NotoSerifAhom-Regular.ttf?raw=true";
      name = "NotoSerifAhom-Regular.ttf";
      sha256 = "2db70c33f5ef1796753743a87817278094fb031ba05d6b51d359c8cb5929631b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSerifAhom-Regular.ttf $out/share/fonts/truetype/NotoSerifAhom-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Serif Ahom";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
