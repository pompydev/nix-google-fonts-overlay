{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "yarndings-12-charted-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/yarndings12charted/Yarndings12Charted-Regular.ttf?raw=true";
      name = "Yarndings12Charted-Regular.ttf";
      sha256 = "4f09a9d084aec3d88ce52d11367713cd91c48ae9a250405fcd0b9112b33bf201";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Yarndings12Charted-Regular.ttf $out/share/fonts/truetype/Yarndings12Charted-Regular.ttf
  '';

  meta = with lib; {
    description = "Yarndings 12 Charted";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
