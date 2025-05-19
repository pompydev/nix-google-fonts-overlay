{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-deseret-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosansdeseret/NotoSansDeseret-Regular.ttf?raw=true";
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
