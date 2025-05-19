{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-gothic-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosansgothic/NotoSansGothic-Regular.ttf?raw=true";
      name = "NotoSansGothic-Regular.ttf";
      sha256 = "5a1b3946cc98fd9ccd8d3b32777cdaa82ae7f0278469d18272e1d9fcf2f6ff87";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansGothic-Regular.ttf $out/share/fonts/truetype/NotoSansGothic-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Gothic";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
