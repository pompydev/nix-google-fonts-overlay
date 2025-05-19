{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-buhid-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosansbuhid/NotoSansBuhid-Regular.ttf?raw=true";
      name = "NotoSansBuhid-Regular.ttf";
      sha256 = "70408dbcf0da33d12d3b582305057a63a3ea132b4bf313027834e5b9b6a7d886";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansBuhid-Regular.ttf $out/share/fonts/truetype/NotoSansBuhid-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Buhid";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
