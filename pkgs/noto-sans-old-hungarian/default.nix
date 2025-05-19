{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-old-hungarian-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosansoldhungarian/NotoSansOldHungarian-Regular.ttf?raw=true";
      name = "NotoSansOldHungarian-Regular.ttf";
      sha256 = "c23b363986fabc168af489c5d4eaf3c10fbb110599ffe6ca3b2eac777aa73079";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansOldHungarian-Regular.ttf $out/share/fonts/truetype/NotoSansOldHungarian-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Old Hungarian";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
