{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-deseret-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosansdeseret/NotoSansDeseret-Regular.ttf?raw=true";
      name = "NotoSansDeseret-Regular.ttf";
      sha256 = "aaab78856a00ca015e8f545200c82093b33192990651a0f62926a13cf0a7b080";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansDeseret-Regular.ttf $out/share/fonts/truetype/NotoSansDeseret-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Deseret";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
