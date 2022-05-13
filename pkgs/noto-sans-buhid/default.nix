{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-buhid-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansbuhid/NotoSansBuhid-Regular.ttf?raw=true";
      name = "NotoSansBuhid-Regular.ttf";
      sha256 = "435cfa275e7ccdff7326430ac498158d0377ac357570efd224f8c2888c8f6b94";
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
